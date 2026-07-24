import plotly.express as px
from plotly.graph_objects import Figure
from functions.data import download_history



def create_plot(ticker:str) -> Figure:
    '''
    Prints an interactive plot with historical data from yahoo finance, using plotly
    Args:
        ticker (str): Ticker name.
    '''
    df = download_history(ticker)
    fig = px.line(
        df, 
        x = 'Date',
        y = 'Close',
        title = f'{ticker} stock price',
    )
    fig.update_layout(title_x=0.5)
    return fig
