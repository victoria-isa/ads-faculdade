import streamlit as st
from functions.plot import create_plot
from functions.backtest import ma_strategy

tab1, tab2 = st.tabs([
    'History', 'Ma Strategy'
])

ticker = st.sidebar.text_input(
    'Choose the ticker:',
    value = 'NVDA'
)


ma_short_window = st.sidebar.number_input(
    "MA Short",
    min_value = 1,
    max_value = 100,
    value = 9,
    step = 1
)

ma_long_window = st.sidebar.number_input(
    "MA Short",
    min_value = 1,
    max_value = 300,
    value = 72,
    step = 1

)

with tab1:
    st.title('Stock History')
    st.write("Inform a ticker and check it's stock recent values.")

    fig = create_plot(ticker)
    st.plotly_chart(fig)
with tab2:
    st.title('MA Strategy')
    st.write("Check your portfolio.")
    df = ma_strategy(
            ticker = ticker, 
            ma_short = ma_short_window, 
            ma_long = ma_long_window
        )

    st.dataframe(df)
