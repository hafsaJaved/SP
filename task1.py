import requests
import urllib,urllib2
from bs4 import BeautifulSoup
from StringIO import StringIO
import os
import logging
import ffmpy

log=logging.getLogger('task1')
hdlr=logging.FileHandler('task1.log')
frmtr=logging.Formatter('%(asctime)s %(message)s')
hdlr.setFormatter(frmtr)
log.addHandler(hdlr)
log.setLevel(logging.INFO)

def get_all_links(URL):

	req = requests.get(URL)
	links = []
	if req.status_code == 200:
		parser_obj = BeautifulSoup(req.content, "html.parser")
		tag_list = parser_obj.find_all("a")
		for a_tag in tag_list:
			if(a_tag!=tag_list[-1] and a_tag!=tag_list[0]):
				links.append(a_tag["href"])

	log.info('Total Qaris : {}'.format(len(links)))
	return links

def download_audios(Qari):
	
	log.info('Qari Name : '+Qari)
	var='https://download.quranicaudio.com/quran/'+Qari
	req=requests.get(var)
	links = []
	i=1
	if not os.path.exists(Qari):
		os.makedirs(Qari)
	if req.status_code == 200:
		parser_obj = BeautifulSoup(req.content, "html.parser")
		tag_list = parser_obj.find_all("a")
		count=len(tag_list)-27
		for a_tag in tag_list[count:]:
			links.append(a_tag["href"])
			log.info('{} ; {} ; START'.format(Qari,a_tag['href']))
			urllib.urlretrieve(var+a_tag["href"],"{}{}".format(Qari,a_tag["href"]))
			log.info('{} ; {} ; END'.format(Qari,a_tag['href']))
			i=i+1
	log.info('Merging Files of {} START'.format(Qari))
	os.system("mp3wrap "+Qari+"Second_Half.mp3 "+Qari+"*.mp3")
	log.info('Merging Files of {} END'.format(Qari))
	#return links

#def merge_Files(Qari):
#	for filename in os.listdir(Qari):
#		os.system('mp3wrap'+filename)
#		if(fiename.endswith(.mp3):
#

def main():
	URL = "https://download.quranicaudio.com/quran/"
	url_list = get_all_links(URL)
	#print url_list

	for i in range(len(url_list)):
		log.info('Start Processing {} of {}'.format(i+1,len(url_list)))
		print download_audios(url_list[i])
		
		#merge_Files(url_list[i])
		

	#val=download_images(url_list)
	#print val

if __name__ == "__main__":
	main()
