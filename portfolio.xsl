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
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Portfolio – <xsl:value-of select="//foaf:name"/></title>
                
                <!-- Recommandation SEO multilingue -->
                <link rel="alternate" hreflang="fr" href="?lang=fr"/>
                <link rel="alternate" hreflang="en" href="?lang=en"/>
                <link rel="alternate" hreflang="zh" href="?lang=zh"/>
                
                <!-- Style CSS complet ici (conserve ton style précédent ici) -->
                <style>
                    * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    }
                    
                    body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background: linear-gradient(135deg, #fdf3f5 0%, #f9e8ec 100%);
                    color: #333;
                    line-height: 1.6;
                    min-height: 100vh;
                    }
                    
                    .container {
                    max-width: 1200px;
                    margin: 0 auto;
                    padding: 2rem;
                    }
                    
                    /* Language Selector Styles */
                    .language-selector {
                    position: fixed;
                    top: 1rem;
                    right: 1rem;
                    z-index: 1000;
                    background: rgba(255, 255, 255, 0.95);
                    backdrop-filter: blur(10px);
                    border-radius: 15px;
                    box-shadow: 0 8px 32px rgba(181, 107, 133, 0.2);
                    padding: 0.5rem;
                    display: flex;
                    gap: 0.5rem;
                    border: 1px solid rgba(214, 136, 169, 0.3);
                    }
                    
                    .language-selector button {
                    background: transparent;
                    border: none;
                    padding: 0.6rem 0.8rem;
                    border-radius: 10px;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    font-size: 0.9rem;
                    font-weight: 600;
                    color: #666;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    min-width: 60px;
                    position: relative;
                    overflow: hidden;
                    white-space: nowrap;
                    }
                    
                    .language-selector button::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: -100%;
                    width: 100%;
                    height: 100%;
                    background: linear-gradient(135deg, #d688a9, #b56b85);
                    transition: all 0.4s ease;
                    z-index: -1;
                    border-radius: 10px;
                    }
                    
                    .language-selector button:hover {
                    color: white;
                    transform: translateY(-2px);
                    box-shadow: 0 4px 15px rgba(181, 107, 133, 0.3);
                    }
                    
                    .language-selector button:hover::before {
                    left: 0;
                    }
                    
                    .language-selector button:active {
                    transform: translateY(0);
                    }
                    
                    /* Responsive adjustments for language selector */
                    @media (max-width: 768px) {
                    .language-selector {
                    top: 0.5rem;
                    right: 0.5rem;
                    padding: 0.3rem;
                    gap: 0.3rem;
                    }
                    
                    .language-selector button {
                    padding: 0.5rem 0.6rem;
                    min-width: 50px;
                    font-size: 0.8rem;
                    }
                    }
                    
                    /* Add margin to body to avoid overlap */
                    body {
                    padding-top: 80px;
                    }
                    
                    /* Hero Section */
                    .hero {
                    background: white;
                    border-radius: 20px;
                    box-shadow: 0 15px 40px rgba(181, 107, 133, 0.15);
                    padding: 3rem;
                    margin-bottom: 3rem;
                    display: flex;
                    align-items: center;
                    gap: 3rem;
                    position: relative;
                    overflow: hidden;
                    }
                    
                    .hero::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    right: 0;
                    width: 200px;
                    height: 200px;
                    background: linear-gradient(45deg, #d688a9, #b56b85);
                    border-radius: 50%;
                    opacity: 0.1;
                    transform: translate(50%, -50%);
                    }
                    
                    .hero-content {
                    flex: 1;
                    z-index: 2;
                    }
                    
                    .hero h1 {
                    color: #b56b85;
                    font-size: 3rem;
                    font-weight: 700;
                    margin-bottom: 1rem;
                    text-shadow: 2px 2px 4px rgba(181, 107, 133, 0.1);
                    }
                    
                    .hero .subtitle {
                    color: #666;
                    font-size: 1.2rem;
                    line-height: 1.5;
                    margin-bottom: 2rem;
                    }
                    
                    .photo-placeholder {
                    width: 200px;
                    height: 200px;
                    background: linear-gradient(135deg, #d688a9, #b56b85);
                    border-radius: 20px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: white;
                    font-size: 1.2rem;
                    font-weight: bold;
                    box-shadow: 0 15px 40px rgba(181, 107, 133, 0.4);
                    flex-shrink: 0;
                    transition: all 0.3s ease;
                    }
                    
                    .photo-placeholder:hover {
                    transform: scale(1.05);
                    box-shadow: 0 20px 50px rgba(181, 107, 133, 0.5);
                    }
                    
                    /* Navigation Buttons */
                    .nav-buttons {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                    gap: 1.5rem;
                    margin-bottom: 3rem;
                    padding: 0.5rem;
                    }
                    
                    .nav-btn {
                    background: rgba(255, 255, 255, 0.8);
                    backdrop-filter: blur(10px);
                    border: 1px solid rgba(214, 136, 169, 0.3);
                    padding: 1.2rem 2rem;
                    border-radius: 50px;
                    box-shadow: 0 4px 20px rgba(181, 107, 133, 0.1);
                    cursor: pointer;
                    transition: all 0.3s ease;
                    text-decoration: none;
                    color: #555;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 1rem;
                    font-weight: 500;
                    text-align: center;
                    position: relative;
                    overflow: hidden;
                    min-height: 50px;
                    }
                    
                    .nav-btn::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: -100%;
                    width: 100%;
                    height: 100%;
                    background: linear-gradient(135deg, #d688a9, #b56b85);
                    transition: all 0.4s ease;
                    z-index: -1;
                    border-radius: 50px;
                    }
                    
                    .nav-btn:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 8px 30px rgba(181, 107, 133, 0.2);
                    color: white;
                    border-color: rgba(214, 136, 169, 0.5);
                    }
                    
                    .nav-btn:hover::before {
                    left: 0;
                    }
                    
                    .nav-btn:active {
                    transform: translateY(-1px);
                    box-shadow: 0 4px 15px rgba(181, 107, 133, 0.3);
                    }
                    
                    /* Content Sections */
                    .section {
                    background: white;
                    border-radius: 20px;
                    box-shadow: 0 10px 30px rgba(181, 107, 133, 0.1);
                    padding: 2.5rem;
                    margin-bottom: 2rem;
                    display: none;
                    }
                    
                    .section.active {
                    display: block;
                    animation: fadeIn 0.5s ease;
                    }
                    
                    @keyframes fadeIn {
                    from { opacity: 0; transform: translateY(20px); }
                    to { opacity: 1; transform: translateY(0); }
                    }
                    
                    .section h2 {
                    color: #b56b85;
                    font-size: 2.2rem;
                    margin-bottom: 2rem;
                    padding-bottom: 1rem;
                    border-bottom: 3px solid #d688a9;
                    position: relative;
                    }
                    
                    .section h2::after {
                    content: '';
                    position: absolute;
                    bottom: -3px;
                    left: 0;
                    width: 60px;
                    height: 3px;
                    background: #b56b85;
                    }
                    
                    /* Experience Cards */
                    .experience-item, .project-item, .education-item {
                    background: #fdf3f5;
                    border-radius: 15px;
                    padding: 2rem;
                    margin-bottom: 1.5rem;
                    border-left: 5px solid #d688a9;
                    transition: all 0.3s ease;
                    }
                    
                    .experience-item:hover, .project-item:hover, .education-item:hover {
                    transform: translateX(10px);
                    box-shadow: 0 8px 25px rgba(181, 107, 133, 0.15);
                    }
                    
                    .date {
                    color: #b56b85;
                    font-weight: bold;
                    font-size: 1.1rem;
                    margin-bottom: 0.5rem;
                    }
                    
                    .company, .project-title {
                    color: #333;
                    font-size: 1.3rem;
                    font-weight: 600;
                    margin-bottom: 0.5rem;
                    }
                    
                    .job-title {
                    color: #d688a9;
                    font-size: 1.1rem;
                    font-weight: 500;
                    margin-bottom: 1rem;
                    }
                    
                    .description {
                    color: #666;
                    line-height: 1.6;
                    }
                    
                    /* Skills Grid */
                    .skills-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
                    gap: 1rem;
                    }
                    
                    .skill-item {
                    background: linear-gradient(135deg, #d688a9, #b56b85);
                    color: white;
                    padding: 1rem;
                    border-radius: 10px;
                    text-align: center;
                    font-weight: 600;
                    box-shadow: 0 5px 15px rgba(181, 107, 133, 0.3);
                    transition: all 0.3s ease;
                    }
                    
                    .skill-item:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 8px 25px rgba(181, 107, 133, 0.4);
                    }
                    
                    /* Languages */
                    .language-item {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    background: #fdf3f5;
                    padding: 1.5rem;
                    margin-bottom: 1rem;
                    border-radius: 10px;
                    border-left: 4px solid #d688a9;
                    }
                    
                    .language-name {
                    font-weight: 600;
                    color: #333;
                    }
                    
                    .language-level {
                    background: linear-gradient(135deg, #d688a9, #b56b85);
                    color: white;
                    padding: 0.5rem 1rem;
                    border-radius: 20px;
                    font-size: 0.9rem;
                    font-weight: 500;
                    }
                    
                    /* Contact Info */
                    .contact-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                    gap: 1.5rem;
                    }
                    
                    .contact-item {
                    background: #fdf3f5;
                    padding: 1.5rem;
                    border-radius: 15px;
                    display: flex;
                    align-items: center;
                    gap: 1rem;
                    transition: all 0.3s ease;
                    }
                    
                    .contact-item:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 8px 25px rgba(181, 107, 133, 0.15);
                    }
                    
                    .contact-item::before {
                    content: '';
                    width: 40px;
                    height: 40px;
                    background: linear-gradient(135deg, #d688a9, #b56b85);
                    border-radius: 50%;
                    flex-shrink: 0;
                    }
                    
                    .contact-item a {
                    color: #333;
                    text-decoration: none;
                    }
                    
                    .contact-item a:hover {
                    color: #b56b85;
                    }
                    
                    /* Responsive */
                    @media (max-width: 768px) {
                    .hero {
                    flex-direction: column;
                    text-align: center;
                    gap: 2rem;
                    }
                    
                    .hero h1 {
                    font-size: 2.5rem;
                    }
                    
                    .nav-buttons {
                    grid-template-columns: 1fr;
                    }
                    
                    .container {
                    padding: 1rem;
                    }
                    }                                    
                </style>
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
                                            
                    
                    <!-- Expériences -->
                    <div id="experience" class="section">
                        <h2><xsl:value-of select="//sections/experience/*[name()=$lang]"/></h2>

                            <xsl:for-each select="//experiences/experience">
                            <div class="experience-item">
                                <div class="date" property="dc:date">
                                    <xsl:value-of select="dc:date"/>
                                </div>
                                <div class="company">
                                    <xsl:value-of select="employer"/>
                                </div>
                                <div class="job-title">
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
                            <div class="project-item">
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
                            <div class="education-item">
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
                            <div class="language-item">
                                <span class="language-name" property="foaf:name">
                                    <xsl:value-of select="foaf:name/*[name()=$lang]"/>
                                </span>
                                <span class="language-level">
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
                                <div class="skill-item">
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