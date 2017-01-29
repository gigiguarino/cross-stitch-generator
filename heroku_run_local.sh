
pip freeze > requirements.txt ;
source venv/bin/activate ;
pip install -r requirements.txt ;
heroku local web ;
