import pandas as pd

file1 = 'branch_a.csv'
file2 = 'branch_b.csv'
file3 = 'branch_c.csv'

# Read the CSV files into DataFrames
df1 = pd.read_csv(file1)
df2 = pd.read_csv(file2)
df3 = pd.read_csv(file3)

# Concatenate the DataFrames
df = pd.concat([df1, df2, df3], ignore_index=True)

# 1. drop row with NaN on transaction_id, date, or customer_id
df.dropna(subset=['transaction_id', 'date', 'customer_id'], inplace=True)

# 2. change date colomn format to datetime
df['date'] = pd.to_datetime(df['date'])

# 3. remove duplicate row based on transaction_id, keep most recent date
# sort the data first by date descending
df.sort_values(by='date', ascending=False, inplace=True)
# then drop duplicates, keep first
df.drop_duplicates(subset=['transaction_id'], keep='first', inplace=True)

# 4. calculate total sales per branch, then output to total_sales_per_branch.csv
total_sales_per_branch = df.groupby('branch')['price'].sum().reset_index()
total_sales_per_branch.columns = ['branch', 'total']
total_sales_per_branch.to_csv('total_sales_per_branch.csv', index=False)

# Print the resulting DataFrame
print(df.to_string(index=False))
