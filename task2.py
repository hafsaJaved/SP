import requests
from PIL import Image
from bs4 import BeautifulSoup
from StringIO import StringIO

name=raw_input("Enter any word(s) : ")
page_no=1
while page_no<=5:
	if page_no==1:
		page=requests.get('https://propakistani.pk/category/sports/')
		
	else:
		var='https://propakistani.pk/category/sports/page/{}'.format(page_no)
		page=requests.get(var)
	page_no=page_no+1
	parser_obj = BeautifulSoup(page.content, "html.parser")
	tag_list=parser_obj.find_all('article')
	for tag in tag_list:
		if name in tag.text:
			print tag.text
			print '\n'

	
	
	

