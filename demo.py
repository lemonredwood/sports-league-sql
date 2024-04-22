import streamlit as st
import mysql.connector
import pandas as pd

# Function to connect to MySQL
def connect_to_mysql():
    mydb = {
        'host': 'localhost',
        'user': 'admin',
        'password': 'password',
        'database': 'IPL'
    }
    try:
        conn = mysql.connector.connect(**mydb)
        return conn
    except mysql.connector.Error as err:
        st.error(f"Error connecting to MySQL: {err}")
        return None 

# Function to fetch data from MySQL and display it
def fetch_and_display_data(table_name):
    conn = connect_to_mysql()
    if conn:
        query = f"SELECT * FROM {table_name};"
        try:
            df = pd.read_sql(query, conn)
            st.write(f"Displaying data from {table_name} table:")
            st.write(df)
        except mysql.connector.Error as err:
            st.error(f"Error executing query: {err}")
        finally:
            conn.close()

# Function to delete a record from the selected table
def delete_from_table(table_name, primary_key_column, primary_key_value):
    conn = connect_to_mysql()
    if conn:
        try:
            cursor = conn.cursor()
            query = f"DELETE FROM {table_name} WHERE {primary_key_column} = '{primary_key_value}';"
            cursor.execute(query)
            conn.commit()
            st.success("Record deleted successfully!")
        except mysql.connector.Error as err:
            st.error(f"Error deleting record: {err}")
        finally:
            conn.close()

# Function to get table attributes
def get_table_attributes(table_name):
    conn = connect_to_mysql()
    attributes = []
    if conn:
        try:
            cursor = conn.cursor()
            cursor.execute(f"DESC {table_name};")
            attributes = [row[0] for row in cursor.fetchall()]
        except mysql.connector.Error as err:
            st.error(f"Error getting table attributes: {err}")
        finally:
            conn.close()
    return attributes

# Function to insert a record into the selected table
def insert_into_table(table_name, **kwargs):
    conn = connect_to_mysql()
    if conn:
        try:
            cursor = conn.cursor()
            columns = ', '.join(kwargs.keys())
            values = ', '.join([f"'{value}'" for value in kwargs.values()])
            query = f"INSERT INTO {table_name} ({columns}) VALUES ({values});"
            cursor.execute(query)
            conn.commit()
            st.success("Record inserted successfully!")
        except mysql.connector.Error as err:
            st.error(f"Error inserting record: {err}")
        finally:
            conn.close()

# Function to search for a record by primary key
def search_by_primary_key(table_name, primary_key_column):
    conn = connect_to_mysql()
    if conn:
        primary_key_value = st.sidebar.text_input(f"Enter value for {primary_key_column} to search:")
        search_button = st.sidebar.button("Search")
        if search_button:
            query = f"SELECT * FROM {table_name} WHERE {primary_key_column} = '{primary_key_value}';"
            try:
                df = pd.read_sql(query, conn)
                st.write(f"Search result for {primary_key_column} = {primary_key_value}:")
                st.write(df)
            except mysql.connector.Error as err:
                st.error(f"Error executing query: {err}")
            finally:
                conn.close()

# Main Streamlit app
def main():
    st.title("IPL Data Analysis")

    st.sidebar.title("Options")
    tables = ["Matches", "Players", "Teams", "HeadCoach", "Stadium"]
    selected_table = st.sidebar.selectbox("Select table", tables)

    operation = st.sidebar.selectbox("Select operation", ("View", "Insert", "Delete", "Search"), index=0)

    if operation == "View":
        if selected_table in tables:
            fetch_and_display_data(selected_table)
        else:
            st.error("Invalid table selected.")
    elif operation == "Delete":
        if selected_table in tables:
            st.write(f"Deleting record from the {selected_table} table:")

            # Get the primary key column for the selected table
            primary_key_column = st.selectbox("Select primary key column", get_table_attributes(selected_table))

            # Allow user to input primary key value
            primary_key_value = st.text_input(f"Enter value for {primary_key_column}:")

            delete_button = st.button("Delete")
            if delete_button:
                delete_from_table(selected_table, primary_key_column, primary_key_value)
        else:
            st.error("Invalid table selected.")
    elif operation == "Insert":
        if selected_table in tables:
            st.write(f"Inserting record into the {selected_table} table:")

            # Get attribute values to insert
            attributes = get_table_attributes(selected_table)
            values = {}
            for attribute in attributes:
                if attribute != "Date":
                    values[attribute] = st.text_input(f"Enter {attribute}:")
                else:
                    values[attribute] = st.date_input(f"Enter {attribute}:")

            insert_button = st.button("Insert")
            if insert_button:
                insert_into_table(selected_table, **values)
        else:
            st.error("Invalid table selected.")
    elif operation == "Search":
        if selected_table in tables:
            st.write(f"Searching record in the {selected_table} table:")

            # Get the primary key column for the selected table
            primary_key_column = st.selectbox("Search", get_table_attributes(selected_table))

            search_by_primary_key(selected_table, primary_key_column)
        else:
            st.error("Invalid table selected.")
    else:
        st.warning("Only 'View', 'Insert', 'Delete', and 'Search' operations are supported currently.")

if __name__ == "__main__":
    main()
