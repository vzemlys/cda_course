Final project
--------

Analysis on Covid-19 impact on economic activity

The economic data is usually reported and quarterly or monthly frequency. Hence it is hard to estimate Covid-19 impact as the economic data is only coming in. In such cases usually the impact can be measured imprecisely by using proxies. The biggest Covid-19 impact on economy is the necessity of enforcement of the quarantine, which reduces people movement. Economic activity correlates with the people movement, hence if we can measure how the people changed their movement behaviour this can be used as a proxy for the economic activity.

In the final project you will have to analyze the impact using Covid-19 case/recovered/death data, effective reproduction rate data and Google mobility report data. 

Covid-19 case data is provided by [John Hopkins Unversity](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series). 

Google mobility data is provided by [Google](https://www.google.com/covid19/mobility/)

Effective reproduction rate R data is provided Simas Kucinskas research paper and accompanying [dashboard](http://trackingr-env.eba-9muars8y.us-east-2.elasticbeanstalk.com). More details about this research can be found in the provided paper. Effective reproduction rate measures the intensity of the epidemic, it can be interpreted as the number of how many new infections arise from one already infected person. It depends both on nature of the disease, being higher for more infectious disease and the measures taken to supress the spread of the disease. 

Tasks.

  1. Pick one country of your choice. 
  
  2. Combine all of the data in one data.frame where rows contain the days and the columns containing the variables of interest: death rate, confirmed cases, recovered cases, effective reproduction rate, mobility changes from the baseline in various environments. Only analyze the data for one country, do not go into regions. 
  
  3. Do an exploratory analysis of the data. Consider adding differences of the data as for the time series daily changes can be more instructive than daily levels.

  4. Try to do a simple model which explains mobility changes with covid-19 cases data

  5. As there are several mobility indicators do a separate model for each and compare the results. Do the covid-19 data explain different mobility indicators differently?

  6. Try using the models for forecasting. Drop the last week of data, estimate the models, and compare the forecasted week with the actual observed data. How good are your forecasts? 

  7. Pick another country which should be similar to the one you chose initialy. Do you get the same results? What could explain the differences if there are any?

The data for the project can be downloaded from the links, or you can use the snapshot taken at 13th of May and placed [here](https://github.com/vzemlys/cda_course/tree/master/data/final_project).





