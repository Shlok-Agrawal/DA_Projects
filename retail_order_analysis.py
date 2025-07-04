# Import required libraries
!pip install kaggle

# Download dataset using Kaggle API
import kaggle
!kaggle datasets download ankitbansal06/retail-orders -f orders.csv

# Read data from the file and handle null values
import pandas as pd
df = pd.read_csv('orders.csv', na_values=['Not Available', 'unknown'])

# Rename column names: make lowercase and replace spaces with underscores
df.columns = [i.strip().lower().replace(' ', '_') for i in df.columns]

# Check unique values in 'ship_mode'
df['ship_mode'].unique()

# Display dataframe info
df.info()
df.descrice()

# Derive new columns: discount, sale_price, and profit
df['discount'] = df['list_price'] * df['discount_percent'] * 0.01
df['sale_price'] = df['list_price'] - df['discount']
df['profit'] = df['sale_price'] - df['cost_price']

# Convert 'order_date' from object to datetime
df['order_date'] = pd.to_datetime(df['order_date'], format='%Y-%m-%d')

# Drop unnecessary columns
df.drop(columns=['cost_price','list_price','discount_percent'], inplace=True)

# Remove duplicate rows
df.drop_duplicates(inplace=True)

# Preview a random sample of 10 rows
df.sample(10)
