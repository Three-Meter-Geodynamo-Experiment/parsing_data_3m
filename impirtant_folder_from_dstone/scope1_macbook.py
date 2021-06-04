import numpy as np
import matplotlib.pyplot as plt
#import matplotlib
#matplotlib.use('WX') # need to declare backend to be able to maximize figure window
from time import sleep # alternately could "import time" and use time.sleep
from time import strftime # get today's data folder automatically

folder = strftime("%m%d%y") #automatically get today's folder
#folder = raw_input('What is the data directory (e.g. 010114)? ')

# Read data initially and plot

dataPoints=36000

# plotRefresh*6 + torqueRefresh should be ~7 seconds because
# torque only saved every ~7 seconds
plotRefresh=1
torqueRefresh=1 

# Make a gaussian to convolve with the torque to quickly smooth
# Torque digitization period is ~0.033 seconds
sigma=0.1 # sigma for gaussian, gaussian is 2*sigma wide
gaussianForTorque=np.exp(-(np.arange(-2*sigma,2*sigma,.0333333))**2/(2*sigma**2))

print 'Loading torque'

plt.ion()

#load and plot data for the first time
torque=np.genfromtxt(('/data/3m/' + folder + '/torque.dat'), skip_footer=1) # skip last line in case it is incomplete
torque[:,1]*=(-1130./1801990.)
smooTorque=np.convolve(torque[:,1],(gaussianForTorque/np.sum(gaussianForTorque)),mode='valid')
tSmooTorque=torque[gaussianForTorque.shape[0]/2:(torque.shape[0]-gaussianForTorque.shape[0]/2),0]
plt.figure(figsize=(16,9)) # guessed and checked to get maximized figure in maximized window, may vary by computer
#managePlot=plt.get_current_fig_manager()
#managePlot.frame.Maximize(True)
if torque.shape[0] < dataPoints:
	#plt.plot(torque[:,0],torque[:,1])
	plt.plot(tSmooTorque,smooTorque)
else:
	#plt.plot(torque[(torque.shape[0]-dataPoints):torque.shape[0],0],torque[(torque.shape[0]-dataPoints):torque.shape[0],1])
	plt.plot(tSmooTorque[(tSmooTorque.shape[0]-dataPoints):tSmooTorque.shape[0]],smooTorque[(smooTorque.shape[0]-dataPoints):smooTorque.shape[0]])
#fig=plt.gcf()
#fig.set_size_inches(11,8.5)
plt.title('Torque')
plt.xlabel('Time (s)')
plt.ylabel('Torque (N*m)')
plt.draw()


whileVar = 1

while whileVar == 1:

	torque=np.genfromtxt(('/data/3m/' + folder + '/torque.dat'), skip_footer=1) # skip last line in case it is incomplete
	torque[:,1]*=(-1130./1801990.)
	smooTorque=np.convolve(torque[:,1],(gaussianForTorque/np.sum(gaussianForTorque)),mode='valid')
	tSmooTorque=torque[gaussianForTorque.shape[0]/2:(torque.shape[0]-gaussianForTorque.shape[0]/2),0]
	for i in range(0, 6):
		plt.clf()
		if torque.shape[0] < dataPoints:
			#plt.plot(torque[:,0],torque[:,1])
			plt.plot(tSmooTorque,smooTorque)
		else:
			#plt.plot(torque[(torque.shape[0]-dataPoints):torque.shape[0],0],torque[(torque.shape[0]-dataPoints):torque.shape[0],1])
			plt.plot(tSmooTorque[(tSmooTorque.shape[0]-dataPoints):tSmooTorque.shape[0]],smooTorque[(smooTorque.shape[0]-dataPoints):smooTorque.shape[0]])
		plt.title('Torque')
		plt.xlabel('Time (s)')
		plt.ylabel('Torque (N*m)')
		plt.draw()
		sleep(plotRefresh) # wait (plotRefresh) seconds to replot without new data
	
	# print ('Waiting ' + str(torqueRefresh) + ' seconds to reload torque data')
	sleep(torqueRefresh) # wait (torqueRefresh) plus (plotRefresh*3) seconds for new data in bin file
	# print 'Reloading torque data'
