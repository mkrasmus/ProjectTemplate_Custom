# Import packages
import pandas as pd
from sys import path
path.append('\\Program Files\\Microsoft.NET\\ADOMD.NET\\160')

from pyadomd import Pyadomd

# Connect to the Analysis Services database.
conn_str = 'Provider=MSOLAP;Data Source=ABC; Catalog=XYZ'

# Use SMSS Analysis Services to design a cube and then use the designer's MDX to create a suitable query
query = "XYZ"

# Output results as pandas dataframe
with Pyadomd(conn_str) as conn:
    with conn.cursor().execute(query) as cur:
        df = pd.DataFrame(cur.fetchone(),
        columns=[i.name for i in cur.description])
