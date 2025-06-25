from flask import Flask, request, session, render_template_string
from lxml import etree

app = Flask(__name__)
app.secret_key = 'supersecretkey'

XML_FILE = 'portfolio.xml'
XSL_FILE = 'portfolio.xsl'
AVAILABLE_LANGUAGES = ['fr', 'en', 'zh']
DEFAULT_LANGUAGE = 'fr'

def get_language():
    if 'lang' in request.args and request.args['lang'] in AVAILABLE_LANGUAGES:
        session['lang'] = request.args['lang']
        return session['lang']
    elif request.method == 'POST' and 'lang' in request.form and request.form['lang'] in AVAILABLE_LANGUAGES:
        session['lang'] = request.form['lang']
        return session['lang']
    elif 'lang' in session:
        return session['lang']
    else:
        accept_langs = request.headers.get('Accept-Language', '')
        for lang in accept_langs.split(','):
            code = lang.strip().split('-')[0]
            if code in AVAILABLE_LANGUAGES:
                return code
    return DEFAULT_LANGUAGE

def apply_xslt(xml_file, xsl_file, lang):
    dom = etree.parse(xml_file)
    xslt_root = etree.parse(xsl_file)
    transform = etree.XSLT(xslt_root)
    result = transform(dom, lang=etree.XSLT.strparam(lang))
    return str(result)

@app.route("/", methods=["GET", "POST"])
def index():
    lang = get_language()
    html_output = apply_xslt(XML_FILE, XSL_FILE, lang)
    return render_template_string(html_output)

if __name__ == "__main__":
    app.run(debug=True)
