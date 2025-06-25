<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:foaf="http://xmlns.com/foaf/0.1/"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:cv="http://rdfs.org/resume-rdf/cv.rdfs#"
                xmlns:schema="http://schema.org/"
                exclude-result-prefixes="foaf dc cv schema">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:param name="lang" select="'fr'"/>
    
    <xsl:template match="/">
        <html lang="{$lang}"
              prefix="foaf: http://xmlns.com/foaf/0.1/ dc: http://purl.org/dc/elements/1.1/ cv: http://rdfs.org/resume-rdf/cv.rdfs# schema: http://schema.org/">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Portfolio – <xsl:value-of select="//foaf:name/*[name()=$lang]"/></title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            
            <body typeof="foaf:Person" about="#me">
                <form method="get" class="language-selector">
                    <button type="submit" name="lang" value="fr">
                        <span style="color: #0055A4;">●</span><span style="color: #FFFFFF;">●</span><span style="color: #EF4135;">●</span> FR
                    </button>
                    <button type="submit" name="lang" value="en">
                        <span style="color: #012169;">●</span><span style="color: #FFFFFF;">●</span><span style="color: #C8102E;">●</span> EN
                    </button>
                    <button type="submit" name="lang" value="zh">
                        <span style="color: #DE2910;">●</span><span style="color: #FFDE00;">●</span><span style="color: #DE2910;">●</span> 中文
                    </button>
                </form>
                
                <div class="container">
                    <div class="hero">
                        <div class="hero-content">
                            <h1 property="foaf:name">
                                <xsl:value-of select="//foaf:name/*[name()=$lang]"/>
                            </h1>
                            <p class="subtitle" property="foaf:title">
                                <xsl:value-of select="//foaf:title/*[name()=$lang]"/>
                            </p>
                        </div>
                        <div class="photo-placeholder">
                            <img src="{concat('static/img/', photo)}" />
                        </div>
                    </div>
                    
                    <div class="nav-buttons">
                        <button class="nav-btn" onclick="showSection('experience')">
                            <xsl:value-of select="//sections/experience/*[name()=$lang]"/>
                        </button>
                        <button class="nav-btn" onclick="showSection('projects')">
                            <xsl:value-of select="//sections/projects/*[name()=$lang]"/>
                        </button>
                        <button class="nav-btn" onclick="showSection('education')">
                            <xsl:value-of select="//sections/education/*[name()=$lang]"/>
                        </button>
                        <button class="nav-btn" onclick="showSection('languages')">
                            <xsl:value-of select="//sections/languages/*[name()=$lang]"/>
                        </button>
                        <button class="nav-btn" onclick="showSection('skills')">
                            <xsl:value-of select="//sections/skills/*[name()=$lang]"/>
                        </button>
                        <button class="nav-btn" onclick="showSection('contact')">
                            <xsl:value-of select="//sections/contact/*[name()=$lang]"/>
                        </button>
                    </div>
                    
                    <div id="experience" class="section">
                        <h2><xsl:value-of select="//sections/experience/*[name()=$lang]"/></h2>
                        <xsl:for-each select="//experiences/experience">
                            <div class="experience-item" typeof="cv:Experience" rel="cv:hasExperience">
                                <div class="date" property="dc:date">
                                    <xsl:value-of select="dc:date"/>
                                </div>
                                <div class="company" property="cv:employer">
                                    <xsl:value-of select="employer"/>
                                </div>
                                <div class="job-title" property="dc:title">
                                    <xsl:value-of select="title/*[name()=$lang]"/>
                                </div>
                                <div class="description" property="dc:description">
                                    <xsl:value-of select="dc:description/*[name()=$lang]"/>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    
                    <div id="projects" class="section">
                        <h2><xsl:value-of select="//sections/projects/*[name()=$lang]"/></h2>
                        <xsl:for-each select="//projects/project">
                            <div class="project-item" typeof="schema:Project" rel="schema:hasPart">
                                <div class="project-title" property="dc:title">
                                    <xsl:value-of select="dc:title/*[name()=$lang]"/>
                                </div>
                                <div class="description" property="dc:description">
                                    <xsl:value-of select="dc:description/*[name()=$lang]"/>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    
                    <div id="education" class="section">
                        <h2><xsl:value-of select="//sections/education/*[name()=$lang]"/></h2>
                        <xsl:for-each select="//education/diploma">
                            <div class="education-item" typeof="cv:Education" rel="cv:hasEducation">
                                <div class="date" property="dc:date">
                                    <xsl:value-of select="dc:date"/>
                                </div>
                                <div class="company" property="dc:title">
                                    <xsl:value-of select="dc:title/*[name()=$lang]"/>
                                </div>
                                <div class="description" property="dc:description">
                                    <xsl:value-of select="dc:description/*[name()=$lang]"/>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    
                    <div id="languages" class="section">
                        <h2><xsl:value-of select="//sections/languages/*[name()=$lang]"/></h2>
                        <xsl:for-each select="//languages/language">
                            <div class="language-item" typeof="cv:Language" rel="cv:hasLanguage">
                                <span class="language-name" property="foaf:name">
                                    <xsl:value-of select="foaf:name/*[name()=$lang]"/>
                                </span>
                                <span class="language-level" property="cv:level">
                                    <xsl:value-of select="level/*[name()=$lang]"/>
                                </span>
                            </div>
                        </xsl:for-each>
                    </div>
                    
                    <div id="skills" class="section">
                        <h2><xsl:value-of select="//sections/skills/*[name()=$lang]"/></h2>
                        <div class="skills-grid">
                            <xsl:for-each select="//skills/skill">
                                <div class="skill-item" rel="cv:hasSkill">
                                    <span property="cv:skill">
                                        <xsl:value-of select="."/>
                                    </span>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                    
                    <div id="contact" class="section">
                        <h2><xsl:value-of select="//sections/contact/*[name()=$lang]"/></h2>
                        <div class="contact-grid">
                            <div class="contact-item">
                                <span property="foaf:phone">
                                    <xsl:value-of select="//contact/foaf:phone"/>
                                </span>
                            </div>
                            <div class="contact-item">
                                <span property="foaf:mbox">
                                    <xsl:value-of select="//contact/foaf:mbox"/>
                                </span>
                            </div>
                            <div class="contact-item">
                                <a property="foaf:homepage">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="//contact/foaf:homepage"/>
                                    </xsl:attribute>
                                    LinkedIn
                                </a>
                            </div>
                            <div class="contact-item">
                                <span property="foaf:based_near">
                                    <xsl:value-of select="//contact/foaf:based_near/*[name()=$lang]"/>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <script>
                    function showSection(sectionId) {
                    const sections = document.querySelectorAll('.section');
                    sections.forEach(section => section.classList.remove('active'));
                    const target = document.getElementById(sectionId);
                    if (target) target.classList.add('active');
                    }
                    document.addEventListener('DOMContentLoaded', function () {
                    showSection('experience');
                    });
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>