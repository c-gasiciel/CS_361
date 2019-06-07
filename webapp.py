from flask import Flask, render_template
from flask import request, redirect, url_for
from db_connector.db_connector import connect_to_database, execute_query

# Create web applicable
webapp = Flask(__name__, static_url_path='/static')

db_connection = connect_to_database()

# Route for adding a new voter
@webapp.route('/add_new_voter', methods=['POST','GET'])
# Provide a view which responds to any requests on this productVendor
def add_new_voter():
    db_connection = connect_to_database()

    if request.method == 'GET':
        return render_template('register.html', myscript = 'stateScript.js')

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
				
@webapp.route('/login')
def login():
	return render_template("login.html", title="data")

@webapp.route('/verifyUser', methods=["POST"])
def verify():
    username = str(request.form["usrname"])
    password = str(request.form["pwd"])
    cursor = db_connection.cursor()
    cursor.execute("SELECT name FROM user_info WHERE name='"+usrname"'")
    user = cursor.fetchone()

    if len(user) is 1:
        return redirect(url_for("home"))
    else:
        return "Failed to login!"

@webapp.route("/home")
def home:
    return render_template("home.html")
	