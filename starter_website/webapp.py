from flask import Flask, render_template
from flask import request, redirect, url_for
# from werkzeug.security import generate_password_hash, check_password_hash
from db_connector.db_connector import connect_to_database, execute_query

# Create web applicable
webapp = Flask(__name__, static_url_path='/static')

db_connection = connect_to_database()

# Route for adding a new voter
@webapp.route('/add_new_voter', methods=['POST','GET'])
# Provide a view which responds to any requests on this productVendor
def add_new_voter():
    db_connection = connect_to_database()

    # Display registration page
    if request.method == 'GET':
        return render_template('register.html', myscript = 'stateScript.js')

    # Submit and validate user registration information
    elif request.method == 'POST':
        print("Adding new voter");
        usrname = request.form["username"]
        pwd = request.form["pwd"]
        confPwd = request.form["confPwd"]
        fname = request.form["fname"]
        lname = request.form["lname"]
        ssn = request.form["ssn"]
        dob = request.form["dob"]
        addr = request.form["stAddr"]
        apt = request.form["apt"]
        city = request.form["city"]
        state = request.form["state"]
        zip = request.form["zip"]
        email = request.form["email"]
     

        query = 'INSERT INTO user_info (username, pswd_hash, first_name, last_name, birthday, street, apt, city, state, zip, email, is_voter) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'
        data = (usrname, pwd, fname, lname, dob, addr, apt, city, state, zip, email, 1)
        execute_query(db_connection, query, data)
        print("Successfully added new people!")
        return redirect('/reg_confirmation')


# Render confirmation of successful registration
@webapp.route('/reg_confirmation')
def success():
    return render_template('success.html', results="You've successfully created a voter account!")

# Render login page
@webapp.route('/login')
def login():
	return render_template("login.html", title="data")

@webapp.route('/verifyUser', methods=["POST"])
def verify():
    db_connection = connect_to_database()
    
    # username = str(request.form["username"])
    # password = str(request.form["password"])
    
    username = request.form['username']
    password = request.form['password']
    print(username)
    print(password)
    cursor = db_connection.cursor()
    sql = 'SELECT username FROM user_info WHERE username = (%s)'
    # user_result = execute_query(db_connection, sql).fetchone()
    
    cursor.execute(sql, (username,))
    user_result = cursor.fetchone()
    print(user_result)

    # if len(user_result) is 1:
    if user_result == None:
        return "Failed to login!"
    
    else:
        return redirect(url_for("home"))

@webapp.route("/home")
def home():
    return render_template("home.html")
	
