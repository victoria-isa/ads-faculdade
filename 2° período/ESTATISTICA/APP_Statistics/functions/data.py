import pandas as pd
import yfinance as yf

def download_history(new_ticker:str, new_multi_level_index:bool=False)-> pd.DataFrame:
    '''
    Download historical data from yahoo finance.
    Args:
        ticker (str): Ticker name.
        multi_level_index (bool): Remove/include multi index
    '''
    df = yf.download(tickers=new_ticker, multi_level_index=new_multi_level_index).reset_index()

    return df

