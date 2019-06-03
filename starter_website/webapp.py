from flask import Flask, render_template
from flask import request, redirect
from db_connector.db_connector import connect_to_database, execute_query
#create the web application
webapp = Flask(__name__)

#provide a route where requests on the web application can be addressed

#provide a route where requests on the web application can be addressed
@webapp.route('/')
#provide a view (fancy name for a function) which responds to any requests on this route
def hello():
    return render_template('register.html');
    
# Route for adding a new voter
@webapp.route('/add_new_voter', methods=['POST','GET'])
# Provide a view which responds to any requests on this productVendor
def add_new_voter():
    db_connection = connect_to_database()

    if request.method == 'GET':
        print("Get request")
        return render_template('register.html')

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

        print(pwd)

        query = 'INSERT INTO user_info (username, pswd_hash, first_name, last_name, birthday, street, apt, city, state, zip, email, is_voter) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'
        data = (usrname, pwd, fname, lname, dob, addr, apt, city, state, zip, email, 1)
        execute_query(db_connection, query, data)
        print("Successfully added new people!")
        return ('Success!  Now you are ready to use the app!');
