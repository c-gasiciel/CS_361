from flask import Flask, render_template
from flask import request, redirect
from db_connector.db_connector import connect_to_database, execute_query

# Create web applicable
webapp = Flask(_name_)

# Route for adding a new voter
@webapp.route('/add_new_voter')
# Provide a view which responds to any requests on this productVendor
