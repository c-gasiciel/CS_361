from flask import Flask, render_template
from flask import request, redirect
from db_connector.db_connector import connect_to_database, execute_query

# Create web applicable
webapp = Flask(_name_)

# Route for adding a new voter
@webapp.route('/add_new_voter', methods=['POST']['GET')
# Provide a view which responds to any requests on this productVendor
def add_new_voter():
    db_connection = connect_to_database()
    if request.method == 'POST':
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

    query = 'INSERT INTO user_info (username, pswd_hash, first_name, last_name, birthday, street, apt)'
