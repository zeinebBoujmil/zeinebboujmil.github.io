<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:foaf="http://xmlns.com/foaf/0.1/"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                exclude-result-prefixes="foaf dc">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:param name="lang" select="'fr'"/>
    
    <xsl:template match="/">

        <html lang="{$lang}" prefix="foaf: http://xmlns.com/foaf/0.1/ dc: http://purl.org/dc/elements/1.1/">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Portfolio – <xsl:value-of select="//foaf:name"/></title>
                
                <!-- Recommandation SEO multilingue -->
                <link rel="alternate" hreflang="fr" href="?lang=fr"/>
                <link rel="alternate" hreflang="en" href="?lang=en"/>
                <link rel="alternate" hreflang="zh" href="?lang=zh"/>
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
                    
                    <!-- Hero -->
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
                            <img src="{concat('static/img/', photo)}" alt="ZB"/>
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
                        <button class="nav-btn" onclick="showSection('video')">
                            Vidéo
                        </button>
                        
                        
 
                    </div>
                                            
                    
                    <!-- Expériences -->
                    <div id="experience" class="section">
                        <h2><xsl:value-of select="//sections/experience/*[name()=$lang]"/></h2>
                        <xsl:for-each select="//experiences/experience">
                            <div class="experience-item" typeof="schema:WorkExperience">
                                <div class="date" property="dc:date">
                                    <xsl:value-of select="dc:date"/>
                                </div>
                                <div class="company" property="schema:worksFor">
                                    <xsl:value-of select="employer"/>
                                </div>
                                <div class="job-title" property="schema:jobTitle">
                                    <xsl:value-of select="title/*[name()=$lang]"/>
                                </div>
                                <div class="description" property="dc:description">
                                    <xsl:value-of select="dc:description/*[name()=$lang]"/>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    
                    <!-- Projets -->
                    <div id="projects" class="section">
                        <h2><xsl:value-of select="//sections/projects/*[name()=$lang]"/></h2>
                        <xsl:for-each select="//projects/project">
                            <div class="project-item" typeof="schema:CreativeWork">
                                <div class="project-title" property="dc:title">
                                    <xsl:value-of select="dc:title/*[name()=$lang]"/>
                                </div>
                                <div class="description" property="dc:description">
                                    <xsl:value-of select="dc:description/*[name()=$lang]"/>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    
                    <!-- Formation -->
                    <div id="education" class="section">
                        <h2><xsl:value-of select="//sections/education/*[name()=$lang]"/></h2>
                        <xsl:for-each select="//education/diploma">
                            <div class="education-item" typeof="schema:EducationalOccupationalCredential">
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
                    
                    <!-- Langues -->
                    <div id="languages" class="section">
                        <h2><xsl:value-of select="//sections/languages/*[name()=$lang]"/></h2>
                        <xsl:for-each select="//languages/language">
                            <div class="language-item" typeof="schema:Language">
                                <span class="language-name" property="foaf:name">
                                    <xsl:value-of select="foaf:name/*[name()=$lang]"/>
                                </span>
                                <span class="language-level" property="schema:proficiencyLevel">
                                    <xsl:value-of select="level/*[name()=$lang]"/>
                                </span>
                            </div>
                        </xsl:for-each>
                    </div>
                    
                    
                    <!-- Compétences -->
                    <div id="skills" class="section">
                        <h2><xsl:value-of select="//sections/skills/*[name()=$lang]"/></h2>
                        <div class="skills-grid">
                            <xsl:for-each select="//skills/skill">
                                <div class="skill-item" property="schema:skill">
                                    <xsl:value-of select="."/>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                    
                    
                    <!-- Contact -->
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
                    <!-- Vidéo -->
                    <div id="video" class="section">
                        <h2>Présentation vidéo</h2>
                        <div class="video-wrapper">
                            <iframe width="560" height="315"
                                    src="https://www.youtube.com/embed/dQw4w9WgXcQ"
                                    title="Présentation"
                                    frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                    allowfullscreen>
                                </iframe>
                        </div>
                    </div>

                    
                </div>
                
                <!-- JS pour les sections -->
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