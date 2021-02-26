
from flask import Flask,flash, render_template, request,session,redirect
from flask_sqlalchemy import SQLAlchemy
import json
import smtplib
import os
from werkzeug.utils import secure_filename
import math

params = {"local_server" : "True" ,
		"fb_url": "https://www.facebook.com/",
		"gt_url" : "https://github.com/arpit456jain/CodeSmashers",
		"tw_url" : "https://www.twitter.com",
		"blog_name" : "CodeSmashersBlog",
		"gmail-user" : "arpit456jain@gmail.com",
		"gmail-password" : "#vanshika jain#" ,
		"about_text" : "I am a Btech 2nd year Computer Science and Engineering student at Madan Mohan Malaviya University Of Technology , Gorakhpur . I just love competitive coding and Web Development.",
		"no_of_posts" : 3,
		"img" : "myimg.avg",
		"admin_user" : "arpit456jain",
		"admin_password" : "1234",
		"login":"True",
		"upload_location" : "\\upload folder"
		}

app = Flask(__name__)
app.config["DEBUG"] = True

local_server = True
SQLALCHEMY_DATABASE_URI = "mysql+mysqlconnector://{username}:{password}@{hostname}/{databasename}".format(
    username="arpit456jain",
    password="qwertyuiop",
    hostname="arpit456jain.mysql.pythonanywhere-services.com",
    databasename="arpit456jain$codesmashersblog",
)
app.config["SQLALCHEMY_DATABASE_URI"] = SQLALCHEMY_DATABASE_URI
app.config["SQLALCHEMY_POOL_RECYCLE"] = 299
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy(app)

class Contacts(db.Model):
    __tablename__ = "contacts"
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    mes = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Posts(db.Model):
    __tablename__ = "posts"
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)

class Comment(db.Model):
    __tablename__ = "comments"
    sno = db.Column(db.Integer, primary_key=True)
    postno = db.Column(db.Integer)
    username = db.Column(db.String(30),nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)


def for_sending_mail_from_Mail():


    con = smtplib.SMTP("smtp.gmail.com",587)
    con.ehlo()
    print("hello sucessfull")
    con.starttls()

    con.login("arpit456jain@gmail.com","#vanshika jain#")
    print("login succesfull")
    # msg = "hello this is arpit "

    return con


def date():
        # datetime object containing current date and time
    now = datetime.now()

    print("now =", now)

    # dd/mm/YY H:M:S
    dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
    print("date and time =", dt_string)

    return str(dt_string)

@app.route('/')
def home():

    posts = Posts.query.all()
    last = math.ceil( len(posts) / int(params['no_of_posts']))
    print(len(posts),last,params['no_of_posts'])
    #logic for pagination for post in index.html
    page = request.args.get('number')
    if not(str(page).isnumeric()):
        page = 1
    else:
        page = int(page)

    # print("all goog till now")
    if len(posts)<params['no_of_posts']:
        print("test")
        prev = "#"
        next = "#"
    elif page == 1:
        prev = "#"
        next = "/?number=" + str(int(page)+1)
    elif page == last:
        next = "#"
        prev = "/?number=" + str(int(page)-1)
    else:
        prev = "/?number=" + str(int(page)-1)
        next = "/?number=" + str(int(page)+1)
    page=page-1
    post = posts[page*int(params['no_of_posts']):page*int(params['no_of_posts'])+int(params['no_of_posts'])]

    # posts = Posts.query.all()[0:params['no_of_posts']]
    return render_template('index.html',params=params,posts=post,prev=prev,next=next)
@app.route("/post/<string:post_slug>", methods=['GET','POST'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    allcmnts = Comment.query.filter_by(postno = post.sno).all()

    if request.method == 'POST':
        print('post mthod')
        content = request.form.get('cmnt')
        username = request.form.get('username')
        postsno = post.sno
        cur_date = date()
        # print(content,postsno,cur_date)
        cmnt = Comment(postno=postsno,content=content,date=cur_date,username=username)
        db.session.add(cmnt)
        db.session.commit()
        flash('Congrats!! Your Comment has been added successfully','success')
        return redirect('/post/'+post.slug)
    # print("all cmnts related to this post",allcmnts)
    return render_template('post.html', params=params, post=post,allcmnts=allcmnts)

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
        flash('Thanks for Contacting Me your message has been saved to my database', 'success')
    return render_template('contact.html',params=params)


@app.route('/about')
def about():

    return render_template('about.html',params=params)
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
            # flash("Log in Successfully","success")
            return render_template('dashboard.html',params=params,posts=posts)
        else:
            # flash("Wrong Password","danger")
            return redirect("/login")

    else:
        return render_template('login.html',params=params)
@app.route("/dashboard",methods=['GET','POST'])
def dashboard():
    if ('user' in session and session['user'] == params['admin_user']):
            #welcome full acces
        posts = Posts.query.all()
        return render_template('dashboard.html',params=params,posts=posts)

    else:
        return redirect("/login")
#add or edit post
@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):

    if 'user' in session  and session['user'] == params['admin_user']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            box_slug = request.form.get('slug')
            box_content = request.form.get('content')
            box_sno = request.form.get('sno')
            cur_date = date()
            print("date is",cur_date,"and type is",type(cur_date))
            if sno == '0':
                #add new post
                post = Posts(title=box_title,slug=box_slug,content=box_content,date=cur_date)
                db.session.add(post)
                db.session.commit()
                flash("New Post is Added Successfully!","success")
                print("added successfully")
                return redirect('/dashboard')
            else:

                #edit the posts
                post = Posts.query.filter_by(sno=sno).first()
                post.sno = box_sno
                post.title = box_title
                post.slug = box_slug
                post.content = box_content
                post.date = cur_date
                db.session.add(post)
                db.session.commit()
                flash("Post has been edit and saved succesfully!","success")
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
        flash("Post Deleted Successfully",'success')
        return redirect('/dashboard')

    else:
        return render_template('login.html')

@app.route("/logout")
def logout():
    global session
    session = {}
    params['login'] = True
    flash("Logged out Successfully","success")
    return redirect('/')




@app.route("/uploader",methods=['GET','POST'])
def uploader():
    if request.method == 'POST':
        print("post req")
        file = request.files['file']
        print(file)
        filename = secure_filename(file.filename)
        file.save(os.path.join(app.root_path+params['upload_location'],filename))
        flash('File uploaded to database succesfully', 'success')
        return redirect('/dashboard')
    else:
        print("get")
    return redirect('/')

