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
                <h1 property="foaf:name">
                    <xsl:value-of select="//foaf:name/*[name()=$lang]"/>
                </h1>
                
                <p property="foaf:title">
                    <xsl:value-of select="//foaf:title/*[name()=$lang]"/>
                </p>
                
                <!-- Experiences -->
                <section>
                    <h2>Expériences</h2>
                    <xsl:for-each select="//experiences/experience">
                        <div rel="cv:hasExperience">
                            <div typeof="cv:Experience">
                                <span property="dc:date">
                                    <xsl:value-of select="dc:date"/>
                                </span><br/>
                                <span property="cv:employer">
                                    <xsl:value-of select="employer"/>
                                </span><br/>
                                <span property="dc:title">
                                    <xsl:value-of select="title/*[name()=$lang]"/>
                                </span><br/>
                                <span property="dc:description">
                                    <xsl:value-of select="dc:description/*[name()=$lang]"/>
                                </span>
                            </div>
                        </div>
                    </xsl:for-each>
                </section>
                
                <!-- Projects -->
                <section>
                    <h2>Projets</h2>
                    <xsl:for-each select="//projects/project">
                        <div rel="schema:hasPart">
                            <div typeof="schema:Project">
                                <span property="dc:title">
                                    <xsl:value-of select="dc:title/*[name()=$lang]"/>
                                </span><br/>
                                <span property="dc:description">
                                    <xsl:value-of select="dc:description/*[name()=$lang]"/>
                                </span>
                            </div>
                        </div>
                    </xsl:for-each>
                </section>
                
                <!-- Education -->
                <section>
                    <h2>Formation</h2>
                    <xsl:for-each select="//education/diploma">
                        <div rel="cv:hasEducation">
                            <div typeof="cv:Education">
                                <span property="dc:date">
                                    <xsl:value-of select="dc:date"/>
                                </span><br/>
                                <span property="dc:title">
                                    <xsl:value-of select="dc:title/*[name()=$lang]"/>
                                </span><br/>
                                <span property="dc:description">
                                    <xsl:value-of select="dc:description/*[name()=$lang]"/>
                                </span>
                            </div>
                        </div>
                    </xsl:for-each>
                </section>
                
                <!-- Languages -->
                <section>
                    <h2>Langues</h2>
                    <xsl:for-each select="//languages/language">
                        <div rel="cv:hasLanguage">
                            <div typeof="cv:Language">
                                <span property="foaf:name">
                                    <xsl:value-of select="foaf:name/*[name()=$lang]"/>
                                </span>
                                -
                                <span property="cv:level">
                                    <xsl:value-of select="level/*[name()=$lang]"/>
                                </span>
                            </div>
                        </div>
                    </xsl:for-each>
                </section>
                
                <!-- Skills -->
                <section>
                    <h2>Compétences</h2>
                    <xsl:for-each select="//skills/skill">
                        <div rel="cv:hasSkill">
                            <span property="cv:skill">
                                <xsl:value-of select="."/>
                            </span>
                        </div>
                    </xsl:for-each>
                </section>
                
                <!-- Contact -->
                <section>
                    <h2>Contact</h2>
                    <div>
                        <span property="foaf:phone">
                            <xsl:value-of select="//contact/foaf:phone"/>
                        </span><br/>
                        <span property="foaf:mbox">
                            <xsl:value-of select="//contact/foaf:mbox"/>
                        </span><br/>
                        <a property="foaf:homepage">
                            <xsl:attribute name="href">
                                <xsl:value-of select="//contact/foaf:homepage"/>
                            </xsl:attribute>
                            LinkedIn
                        </a><br/>
                        <span property="foaf:based_near">
                            <xsl:value-of select="//contact/foaf:based_near/*[name()=$lang]"/>
                        </span>
                    </div>
                </section>
                
                
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
