from flask import Flask,flash, render_template, request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)
# app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+mysqldb://root:@localhost/codesmashersblog"

#now we use config.json
with open('config.json','r') as c:
    params = json.load(c)['params']
local_server = True

app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
db = SQLAlchemy(app)

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    mes = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Posts(db.Model):  
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
  

def for_sending_mail_from_Mail():
    import smtplib

    con = smtplib.SMTP("smtp.gmail.com",587)
    con.ehlo()
    print("hello sucessfull")
    con.starttls()

    con.login("arpit456jain@gmail.com","#vanshika jain#")
    print("login succesfull")
    # msg = "hello this is arpit "
    
    return con

import math 
@app.route('/')
def home():
    
    posts = Posts.query.all()
    last = math.ceil( len(posts) // int(params['no_of_posts']))
    # print(len(posts),last,params['no_of_posts'])
    #logic for pagination for post in index.html
    page = request.args.get('number')
    if not(str(page).isnumeric()):
        page = 1
    else:
        page = int(page)
    # print("all goog till now")
    if page == 1:
        prev = "#"
        next = "/?number=" + str(int(page)+1)
    elif page == last:
        next = "#"
        prev = "/?number=" + str(int(page)-1)
    else:
        prev = "/?number=" + str(int(page)-1)
        next = "/?number=" + str(int(page)+1)
    page = page-1
    post = posts[page*int(params['no_of_posts']):page*int(params['no_of_posts'])+int(params['no_of_posts'])]
   
    # posts = Posts.query.all()[0:params['no_of_posts']]
    return render_template('index.html',params=params,posts=post,prev=prev,next=next)


@app.route('/about')
def about():
   
    return render_template('about.html',params=params)

@app.route('/contact',methods = ['GET' ,'POST'])
def contact():
    if request.method =='POST' :
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num = phone, mes = message,email = email )
        db.session.add(entry)
        db.session.commit()

        # now we will send email to us with this contact 
        mail = for_sending_mail_from_Mail() #fun call for mail
        mail.sendmail("arpit456jain@gmail.com","111arpit1@gmail.com","Subject:Tut \n\n"+message+"\n"+phone)    
    return render_template('contact.html',params=params)


# @app.route("/post", methods=['GET'])
# def post_route():
    
#     return render_template('post.html')
   
@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    print(post)
    return render_template('post.html', params=params, post=post)
  

# session = {'user':params['admin_user']}
session={}
app.secret_key = "super-secret-key"
@app.route('/login',methods=['GET','POST'])
def login():
    # if user is already login
    if ('user' in session and session['user'] == params['admin_user']):
        params['login'] = False
        return redirect('/dashboard')
    elif request.method == 'POST':
        #redirect to panel
        username = request.form.get('uname')
        upassword = request.form.get('pass')

        if ( username == params['admin_user'] and upassword == params["admin_password"]):
            #set the session var
            session['user'] = username
            params['login'] = False
            posts = Posts.query.all()
            return render_template('dashboard.html',params=params,posts=posts)

    else:
        return render_template('login.html',params=params)

@app.route("/dashboard",methods=['GET','POST'])
def dashboard():
    if ('user' in session and session['user'] == params['admin_user']):
            #welcome full acces
        posts = Posts.query.all()
        return render_template('dashboard.html',params=params,posts=posts)
        
    else:
        return render_template('login.html')

@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    
    if 'user' in session  and session['user'] == params['admin_user']:
        if request.method == 'POST':
            box_title = request.form.get('title') 
            box_slug = request.form.get('slug')
            box_content = request.form.get('content')
            box_sno = request.form.get('sno')
            
            if sno == '0':
                #add new post
                post = Posts(title=box_title,slug=box_slug,content=box_content)
                db.session.add(post)
                db.session.commit()
                print("added successfully")
                return redirect('/dashboard')
            else:
                
                #edit the posts
                post = Posts.query.filter_by(sno=sno).first()
                post.sno = box_sno
                post.title = box_title
                post.slug = box_slug
                post.content = box_content
                db.session.add(post)
                db.session.commit()
                return redirect('/dashboard')
               
        else:
            post = Posts.query.filter_by(sno=sno).first() 
            print("we have post",post)
            return render_template('edit.html',post=post,params=params,sno=sno)
    else:
        return render_template('login.html')

@app.route("/delete/<string:sno>",methods=['GET','POST'])
def delete(sno):
    
    if 'user' in session  and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()   
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')
        
    else:
        return render_template('login.html')

@app.route("/logout")
def logout():
    global session
    session = {}
    params['login'] = True
    return redirect('/')




@app.route("/uploader",methods=['GET','POST'])
def uploader():
    if request.method == 'POST':
        print("post")
        file = request.files['file']
        filename = secure_filename(file.filename)
        file.save(os.path.join(app.root_path+params['upload_location'],filename))
        # flash('Message sent succesfully', 'succes')
        return "uploaded succesfully!!"
    else:
        print("get")
    return redirect('/')




if __name__ == '__main__':
    app.run(debug=True)