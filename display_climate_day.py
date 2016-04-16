import os
import json
import warnings
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib.widgets import Button

def display_climate_day(prefix, year, res_in_arcsec):

    nodeIds1,rains  = climate_for_year_from_file(prefix+'_rainfall_daily.bin', year)
    nodeIds2,temps  = climate_for_year_from_file(prefix+'_air_temperature_daily.bin', year)
    nodeIds3,humids = climate_for_year_from_file(prefix+'_relative_humidity_daily.bin', year)

    latlons=[lat_lon_from_nodeid(n,res_in_arcsec/3600.) for n in nodeIds1]
    yy,xx=zip(*latlons)

    day_of_year=1
    rain  = rains[day_of_year-1,:]
    temp  = temps[day_of_year-1,:]
    humid = humids[day_of_year-1,:]

    fig, ax = plt.subplots(figsize=(16,6.5))
    fig.subplots_adjust(left=0.05, bottom=0.1, top=0.9, right=0.97)
    txt = fig.text(0.5, 0.95, '%d - day %d' % (year, day_of_year), fontweight='bold', ha='center')

    rain_scatter_panel=plt.subplot(231,aspect=1)
    rain_scatter=plt.scatter(xx,yy,c=rain,s=5,cmap='Greens',lw=0, norm=mpl.colors.LogNorm(), vmin=0.1, vmax=100)
    plt.colorbar()

    rain_hist_panel=plt.subplot(234)
    print('Rainfall (mm): [%0.2f - %0.2f]' % (min(rain),max(rain)))
    plt.hist(rain, bins=np.arange(0,100,1), alpha=0.3)
    plt.xlabel('Rainfall (mm)')

    temp_scatter_panel=plt.subplot(232,aspect=1)
    temp_scatter=plt.scatter(xx,yy,c=temp,s=5,cmap='Spectral_r',lw=0, vmin=15, vmax=35)
    plt.colorbar()

    temp_hist_panel=plt.subplot(235)
    print('Air temperature (C): [%0.2f - %0.2f]' % (min(temp),max(temp)))
    plt.hist(temp, bins=np.arange(0,50,0.2), alpha=0.3)
    plt.xlabel('Air temperature (C)')

    humid_scatter_panel=plt.subplot(233,aspect=1)
    humid_scatter=plt.scatter(xx,yy,c=humid,s=5,cmap='Blues',lw=0, vmin=0, vmax=1)
    plt.colorbar()

    humid_hist_panel=plt.subplot(236)
    print('Relative humidity: [%d - %d%%]' % (100*min(humid),100*max(humid)))
    plt.hist(humid, bins=np.arange(0,1.005,0.005), alpha=0.3)
    plt.xlabel('Relative Humidity')

    def redraw(doy):
        txt.set_text('%d - day %d' % (year, doy))

        rain=rains[doy-1,:]
        #rain_scatter.set_array(rain)
        rain_scatter_panel.clear()
        rain_scatter_panel.scatter(xx,yy,c=rain,s=5,cmap='Greens',lw=0, norm=mpl.colors.LogNorm(), vmin=0.1, vmax=100)
        rain_hist_panel.clear()
        rain_hist_panel.hist(rain, bins=np.arange(0,100,1), alpha=0.3)

        temp=temps[doy-1,:]
        #temp_scatter.set_array(temp)
        temp_scatter_panel.clear()
        temp_scatter_panel.scatter(xx,yy,c=temp,s=5,cmap='Spectral_r',lw=0, vmin=15, vmax=35)
        temp_hist_panel.clear()
        temp_hist_panel.hist(temp, bins=np.arange(0,50,0.2), alpha=0.3)

        humid=humids[doy-1,:]
        #humid_scatter.set_array(humid)
        humid_scatter_panel.clear()
        humid_scatter_panel.scatter(xx,yy,c=humid,s=5,cmap='Blues',lw=0, vmin=0, vmax=1)
        humid_hist_panel.clear()
        humid_hist_panel.hist(humid, bins=np.arange(0,1.005,0.005), alpha=0.3)

        fig.canvas.draw()

    class Index:
        def __init__(self):
            self.doy = day_of_year
            self.ntsteps = 365+1 # because of indexing differences
            
        def minus_day(self, event):
            self.doy = self.doy-1 if self.doy > 1 else self.doy
            redraw(self.doy)

        def plus_day(self, event):
            self.doy = self.doy+1 if self.doy < self.ntsteps-1 else self.doy
            redraw(self.doy)

        def minus_wk(self, event):
            self.doy = self.doy-7 if self.doy > 7 else self.doy
            redraw(self.doy)

        def plus_wk(self, event):
            self.doy = self.doy+7 if self.doy < self.ntsteps-7 else self.doy
            redraw(self.doy)

        def minus_mo(self, event):
            self.doy = self.doy-30 if self.doy > 30 else self.doy
            redraw(self.doy)

        def plus_mo(self, event):
            self.doy = self.doy+30 if self.doy < self.ntsteps-30 else self.doy
            redraw(self.doy)

    callback = Index()

    axprev = plt.axes([0.4, 0.94, 0.04, 0.04])
    axnext = plt.axes([0.56, 0.94, 0.04, 0.04])
    axprevwk = plt.axes([0.34, 0.94, 0.04, 0.04])
    axnextwk = plt.axes([0.62, 0.94, 0.04, 0.04])
    axprevmo = plt.axes([0.28, 0.94, 0.04, 0.04])
    axnextmo = plt.axes([0.68, 0.94, 0.04, 0.04])

    bnext = Button(axnext, '+1d')
    bnext.on_clicked(callback.plus_day)

    bprev = Button(axprev, '-1d')
    bprev.on_clicked(callback.minus_day)

    bnextwk = Button(axnextwk, '+1w')
    bnextwk.on_clicked(callback.plus_wk)

    bprevwk = Button(axprevwk, '-1w')
    bprevwk.on_clicked(callback.minus_wk)

    bnextmo = Button(axnextmo, '+1m')
    bnextmo.on_clicked(callback.plus_mo)

    bprevmo = Button(axprevmo, '-1m')
    bprevmo.on_clicked(callback.minus_mo)

    plt.show()

def get_xpix_ypix(nodeid):
    ypix = (nodeid-1) & 2**16-1
    xpix = (nodeid-1) >> 16
    return (xpix,ypix)

def lat_lon_from_nodeid(nodeid, res_in_deg):
    xpix,ypix = get_xpix_ypix(nodeid)
    lat = ypix*res_in_deg - 90.0
    lon = xpix*res_in_deg - 180.0
    return (lat,lon)

def nodeid_from_lat_lon(lat, lon, res_in_deg):
    xpix = int(math.floor((lon + 180.0) / res_in_deg))
    ypix = int(math.floor((lat + 90.0) / res_in_deg))
    nodeid = (xpix << 16) + ypix + 1
    return nodeid

def parse_node_offsets(nodeOffsets, n_nodes):
    nodeIds=[]
    lastOffset=-1
    if len(nodeOffsets)/16 != n_nodes:
        raise Exception('Offset length not compatible with # of nodes from header')
    for i in range(n_nodes):
        nodeId=int(nodeOffsets[i*16:i*16+8],16)
        offset=int(nodeOffsets[i*16+8:i*16+16],16)
        if offset < lastOffset:
            raise Exception('Offsets not sequential')
        else:
            lastOffset=offset
        nodeIds.append(nodeId)
    return nodeIds

def climate_for_year_from_file(climatefile, year):
    with open(climatefile+'.json','r') as header:
        hj=json.loads(header.read())
        n_nodes = hj['Metadata']['NodeCount']
        n_tstep = hj['Metadata']['DatavalueCount']
        years   = hj['Metadata']['OriginalDataYears']
        first_year = int(years.split('-')[0])
        print(os.path.basename(climatefile))
        print( "\tThere are %d nodes and %d time steps" % (n_nodes, n_tstep) )
        print( "\tExtracting year %d from file with range %s" % (year, years) )
        nodeIds = parse_node_offsets(hj['NodeOffsets'], n_nodes)

    with open(climatefile, 'rb') as bin_file:
        channel_dtype = np.dtype( [ ( 'data', '<f4', (1, n_nodes ) ) ] )
        channel_data = np.fromfile( bin_file, dtype=channel_dtype )
        channel_data = np.transpose( channel_data['data'].reshape(n_nodes, n_tstep) )

    if first_year > year or 365*(year-first_year+1) > n_tstep:
        raise Exception('Year %d is not in climate file range: %s' % (year,years))
    if hj['Metadata']['StartDayOfYear'] != 'January 1':
        raise Exception('Starting on days other than January 1st (i.e. %s) not supported' % hj['Metadata']['StartDayOfYear'])

    data = channel_data[365*(year-first_year):365*(year-first_year+1)][:]

    nan_count = np.isnan(data).sum()
    if nan_count:
        warnings.warn('There are %d NaN values in %s' % (nan_count,climatefile), RuntimeWarning)
    inf_count = np.isinf(data).sum()
    if inf_count:
        warnings.warn('There are %d Inf values in %s' % (inf_count,climatefile), RuntimeWarning)
        
    return nodeIds,data

if __name__ == '__main__':
    #display_climate_day('Senegal_Gambia/Senegal_Gambia_2_5arcmin', year=2011, res_in_arcsec=150)
    #display_climate_day('Zambia/Zambia_2_5arcmin', year=2011, res_in_arcsec=150)
    #display_climate_day('Zambia/Gwembe_Sinazongwe_pop_cluster/Zambia_Gwembe_Sinazongwe_30arcsec', year=2011, res_in_arcsec=30)
    display_climate_day('Zambia/Gwembe_Sinazongwe_121_nodes/Zambia_30arcsec', year=2007, res_in_arcsec=30)
