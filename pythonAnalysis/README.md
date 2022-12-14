# Python script for counting words from the transformations
- this virtual enviroment was used to count all of the words of all of the 3 groups of quotes
- male-quote, female-quote and sw-quote
- the script uses the following path to find the js files /html_css/js/stories/
- it then uses regex to find all of the information between two backticks 
- it inputs this string which is the xml transformation, into a lxml HTML object
- then uses xpath to get all of the quotes and the word counts are mapped to the respective quote-tags

## steps to recreate
- enter the virtual enviroment make sure you have virtual enviroment installed
- make sure you have python3 installed
- pip install virtualenv or pip3 install virtualenv or python3 -m pip install virtualenv or pip3 install virtualenv
- then do 'source bin/activate'
- then run pip install -r requirements.txt to get all of the necessary imports into the virtual environment
- then run the script with python3 wordCount.py