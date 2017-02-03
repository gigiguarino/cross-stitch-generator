
import thread_colors

# look into Pillow for python for adding lines to images

colors_used = []


def add_grid(img, height, width):
	for i in range(0, height):
		if (i%10 == 0):
			# add dark line
		else:
			# add regular line
	for i in range(0, width):
		if (i%10 == 0):
			# add dark line
		else:
			# add light line


def up_sample(img, new_height, new_width):


def down_sample(img, new_height, new_width):




def get_thread_colors(img, height, width):
	for i in range(0, height):
		for j in range(0, width):
			red = img[i, j, 0]
			green = img[i, j, 1]
			blue = img[i, j, 2]
			current_color = find_closest(red, green, blue)
			img[i, j, 0] = current_color.r
			img[i, j, 1] = current_color.g
			img[i, j, 2] = current_color.b
			colors_used.append(current_color.hex)
	colors_used = sorted(colors_used)


def start_program(image, new_height, new_width, num_colors):
	img = imread('test.jpg')

	# get height and width in pixels of image
	img_height = len(img[0])
	img_width = len(img[1])

	# ratio of image size to desired size
	height_ratio = new_height/img_height
	width_ratio = new_width/img_width

	# get red, green, and blue channels
	img_red = img
	img_green = img
	img_blue = img
	img_red[:, :, 1] = 0
	img_red[:, :, 2] = 0
	img_green[:, :, 0] = 0
	img_green[:, :, 2] = 0
	img_blue[:, :, 0] = 0
	img_blue[:, :, 1] = 0

	# up sample by desired size
	up_img_red = up_sample(img_red, img_height*new_height, img_width*new_width)
	up_img_green = up_sample(img_green, img_height*new_height, img_width*new_width)
	up_img_blue = up_sample(img_blue, img_height*new_height, img_width*new_width)
	
	# down sample by original size
	final_red = down_sample(up_img_red, new_height, new_width)
	final_green = down_sample(up_img_green, new_height, new_width)
	final_blue = down_sample(up_img_blue, new_height, new_width)









#@app.route('/create', methods=['GET'])
#def test():
	#return "hello"

@app.route('/create', methods=['GET'])
def create():
	try:
		height = request.args.get('height', 0, type=int)
		width = request.args.get('width', 0, type=int)
		num_colors = request.args.get('numcolors', 0, type=int)
		fabric_count = request.args.get('fabriccount', 0, type=int)
		return Response(start_program(img_link, height*fabric_count, width*fabric_count, num_colors))
	except Exception as e:
		return str(e)

if __name__ == '__main__':
	app.run()