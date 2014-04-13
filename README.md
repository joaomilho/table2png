table2png
=========

Simple web app that receives an HTML table and outputs a cropped PNG

Install
==

Download wkhtmltoimage (mac):

```
curl https://wkhtmltopdf.googlecode.com/files/wkhtmltoimage-OSX-0.10.0_rc2-static.tar.bz2 -o wkhtmltoimage-OSX-0.10.0_rc2-static.tar.bz2 && tar -xzvf wkhtmltoimage-OSX-0.10.0_rc2-static.tar.bz2
```

Bundle:

```
bundle install
```

Run:

```
thin start
```

That's it. Now you have it running on [http://localhost:9292/](http://localhost:9292/)