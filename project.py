#!/usr/bin/python

from flask import Flask, render_template, request, send_file, send_from_directory, Response
import matlab.engine
import psycopg2
import json
import os 

app = Flask(__name__)




@app.route('/favicon.ico')
def favicon():
	return send_from_directory(os.path.join(app.root_path, 'static'), 'favicon.ico', mimetype='image/vnd.microsoft.icon')


@app.route('/')
def blank():
	return render_template('index.html')


@app.route('/home')
def home():
	return render_template('home.html')

@app.route('/project')
def project():
	return render_template('project.html')

@app.route('/code')
def code():
	return render_template('code.html')

@app.route('/info')
def info():
	return render_template('info.html')


def start_program(img_link, height_in, width_in, num_colors):

	eng = matlab.engine.start_matlab('nojvm')

	eng.addpath('m_files', nargout=0)
	eng.workspace['img_url'] = str(img_link)
	eng.eval("img_url = char(img_url);", nargout=0)
	eng.eval("img = imread(img_url, 'jpg');", nargout=0)
	eng.eval("sizes = size(img);", nargout=0)
	eng.eval("h = sizes(1);", nargout=0)
	eng.eval("w = sizes(2);", nargout=0)
	img_height = eng.workspace['h']
	img_width = eng.workspace['w']

	if (img_height > 300):
		eng.eval("img = imresize(img, 300/h);", nargout=0)
		eng.eval("sizes = size(img);", nargout=0)
		eng.eval("h = sizes(1);", nargout=0)
		eng.eval("w = sizes(2);", nargout=0)
		img_height = eng.workspace['h']
		img_width = eng.workspace['w']

	if (img_width > 300):
		eng.eval("img = imresize(img, 300/w);", nargout=0)
		eng.eval("sizes = size(img);", nargout=0)
		eng.eval("h = sizes(1);", nargout=0)
		eng.eval("w = sizes(2);", nargout=0)
		img_height = eng.workspace['h']
		img_width = eng.workspace['w']


	ratio = img_height / img_width

	if (ratio > 0):
		# img height is greater than width
		new_height = height
		x = height/img_height
		new_width = round(img_width * x)
	else:
		# img width is greater than height
		new_width = width
		x = width/img_width 
		new_height = round(img_height * x)


	eng.workspace['new_height'] = new_height
	eng.workspace['new_width'] = new_width
	eng.workspace['num_colors'] = num_colors
	eng.eval("cross_stitch(img, new_height, new_width, num_colors);", nargout=0)

	# NEED TO GET IMAGE FROM DIRECTORY

	#print "finished"
	#print "Cross stitch image is saved in directory as 'output.jpg'"
	#print "Symbol image is saved in directory as 'symbols.txt'\n\n"

	eng.quit()



#@app.route('/create', methods=['GET'])
#def test():
	#return "hello"

@app.route('/create', methods=['GET'])
def create():
	try:
		img_link = request.args.get('imglink', 0, type=str)
		height = request.args.get('height', 0, type=int)
		width = request.args.get('width', 0, type=int)
		num_colors = request.args.get('numcolors', 0, type=int)
		fabric_count = request.args.get('fabriccount', 0, type=int)
		return Response(start_program(img_link, height*fabric_count, width*fabric_count, num_colors))
	except Exception as e:
		return str(e)

if __name__ == '__main__':
	app.run()






