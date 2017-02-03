
# this is going to initialize vectors of RGB values for DMC threads
# reading from threads.txt
# this will also contain a function that tries to find closest color thread

colors = []

class color:
	def __init__(self, red, green, blue, hex_val, num):
		self.r = red
		self.g = green
		self.b = blue
		self.hex = hex_val
		self.num = num


def create_vector():
	global colors

	done = 0
	file = open('threads.txt', 'r')

	while (done == 0):
		line = f.readline()
		elements = line.split()
		c = color(elements[2], elements[3], elements[4], elements[5], elements[0])
		colors.append(c)



def find_closest(r, g, b):
	closest_color = 0
	smallest_diff = 0

	for i in range(0, colors.size()):
		
		r2 = colors[i].r
		g2 = colors[i].g
		b2 = colors[i].b

		d = ((r2-r)*0.30)^2 + ((g2-g)*0.59)^2 + ((b2-b)*0.11)^2

		if i == 0:
			smallest_diff = d
			closest_color = colors[i]

		else:
			if (d < smallest_diff):
				smallest_diff = d
				closest_color = colors[i]

	return closest_color




