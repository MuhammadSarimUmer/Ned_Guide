import 'package:flutter/material.dart';

class NEDUniversityCard extends StatelessWidget {
  final VoidCallback? onPressed;

  const NEDUniversityCard({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.purple, width: 2.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1562774053-701939374585?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            // Content
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ABOUT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Learn More about Your University',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed:
                          onPressed ??
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NEDUniversityAboutPage(),
                              ),
                            );
                          },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 3,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Explore More',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NEDUniversityAboutPage extends StatefulWidget {
  const NEDUniversityAboutPage({Key? key}) : super(key: key);

  @override
  State<NEDUniversityAboutPage> createState() => _NEDUniversityAboutPageState();
}

class _NEDUniversityAboutPageState extends State<NEDUniversityAboutPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.purple,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'NED University',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1607237138185-eedd9c632b0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=2000&q=80',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.4),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // University Overview Card
                      _buildSectionCard(
                        'About NED University of Engineering and Technology',
                        '''NED University of Engineering & Technology (formerly known as NED Government Engineering College) is one of Pakistan's oldest and most prestigious engineering institutions. Established in 1922, it has been at the forefront of engineering education and research for over a century.

Located in the heart of Karachi, Sindh, Pakistan, NED University stands as a beacon of excellence in engineering, technology, and applied sciences. The university has consistently maintained its reputation as one of the leading technical institutions in South Asia, producing thousands of skilled engineers, technologists, and researchers who have contributed significantly to Pakistan's development and the global engineering community.

The institution was named after Nadirshaw Eduljee Dinshaw, a prominent Parsi philanthropist who generously donated funds for its establishment. This legacy of philanthropy and community service continues to be an integral part of the university's ethos.''',
                        Icons.school,
                        Colors.purple,
                      ),

                      const SizedBox(height: 20),

                      // History and Heritage Card
                      _buildSectionCard(
                        'Rich History and Heritage',
                        '''The foundation stone of NED Government Engineering College was laid in 1922, marking the beginning of a journey that would shape Pakistan's engineering landscape. Initially established as a government college under the British colonial administration, it was conceived to meet the growing demand for qualified engineers in the Indian subcontinent.

The college was named after Nadirshaw Eduljee Dinshaw (1846-1924), a Parsi businessman and philanthropist who made substantial contributions to educational institutions. His vision was to create an institution that would provide quality technical education accessible to all deserving students, regardless of their background.

During the early years, the college faced numerous challenges including limited resources, faculty shortages, and infrastructural constraints. However, under the dedicated leadership of pioneering educators and administrators, it gradually established itself as a center of excellence.

After the partition of India in 1947, the college became part of Pakistan and continued its mission of producing competent engineers. In 1951, it was affiliated with the University of Karachi, and later in 1977, it gained the status of a constituent college.

The transformation from a college to a university came in 1993 when it was granted university status by the Government of Sindh, becoming NED University of Engineering & Technology. This elevation marked a new era of growth, research, and international collaboration.''',
                        Icons.history,
                        Colors.orange,
                      ),

                      const SizedBox(height: 20),

                      // Academic Excellence Card
                      _buildSectionCard(
                        'Academic Excellence and Programs',
                        '''NED University offers a comprehensive range of undergraduate, graduate, and doctoral programs across multiple disciplines of engineering and technology. The university's academic structure is organized into several faculties and departments, each dedicated to specific areas of engineering and applied sciences.

UNDERGRADUATE PROGRAMS:
- Bachelor of Engineering (BE) in Civil Engineering
- BE in Mechanical Engineering
- BE in Electrical Engineering
- BE in Electronics Engineering
- BE in Chemical Engineering
- BE in Computer & Information Systems Engineering
- BE in Industrial & Manufacturing Engineering
- BE in Metallurgical & Materials Engineering
- BE in Petroleum & Gas Engineering
- BE in Textile Engineering
- BE in Urban & Infrastructure Engineering
- BE in Food Engineering
- Bachelor of Computer Science (BCS)
- Bachelor of Software Engineering (BSE)

GRADUATE PROGRAMS:
The university offers Master's and PhD programs in all engineering disciplines, providing advanced research opportunities and specialized knowledge in cutting-edge technologies.

RESEARCH CENTERS:
- Center for Advanced Studies in Energy
- Water Resources Research Center
- Materials Research Laboratory
- Computer Vision and Machine Learning Lab
- Renewable Energy Research Center
- Earthquake Engineering Research Center

The curriculum is regularly updated to incorporate the latest technological advancements and industry requirements, ensuring graduates are well-prepared for the challenges of the modern engineering world.''',
                        Icons.book,
                        Colors.blue,
                      ),

                      const SizedBox(height: 20),

                      // Campus and Infrastructure Card
                      _buildSectionCard(
                        'Campus and Infrastructure',
                        '''The NED University campus spans over 100 acres in the University Road area of Karachi, providing a conducive environment for learning and research. The campus combines historical architecture with modern facilities, creating a unique blend of tradition and innovation.

MAIN BUILDINGS:
- Administrative Block: Houses the main offices, registrar, and administrative departments
- Academic Blocks: State-of-the-art classrooms equipped with modern teaching aids
- Engineering Laboratories: Specialized labs for each department with latest equipment
- Computer Centers: Multiple computer labs with high-speed internet connectivity
- Central Library: A vast repository of books, journals, and digital resources

RESEARCH FACILITIES:
- Advanced research laboratories with modern instrumentation
- Pilot plants for chemical and petroleum engineering
- Testing facilities for materials and structural engineering
- Clean rooms for electronics and semiconductor research
- High-performance computing cluster for computational research

STUDENT FACILITIES:
- Multiple hostels accommodating thousands of students
- Dining halls and cafeterias serving diverse cuisines
- Sports complexes with facilities for cricket, football, basketball, and tennis
- Gymnasium and fitness centers
- Medical center with qualified healthcare professionals
- Mosque for religious activities
- Student activity centers and recreational areas

RECENT DEVELOPMENTS:
The university has recently completed several infrastructure projects including new academic blocks, upgraded laboratories, and enhanced IT infrastructure to support digital learning initiatives.''',
                        Icons.location_city,
                        Colors.green,
                      ),

                      const SizedBox(height: 20),

                      // Faculty and Research Card
                      _buildSectionCard(
                        'Distinguished Faculty and Research',
                        '''NED University takes pride in its highly qualified and experienced faculty members who are leaders in their respective fields. The university employs over 400 faculty members, including professors, associate professors, and assistant professors, many of whom hold doctoral degrees from renowned international universities.

FACULTY EXCELLENCE:
- PhD holders from prestigious institutions worldwide including MIT, Stanford, Cambridge, Oxford
- Industry professionals bringing practical experience to academic programs
- Researchers actively engaged in cutting-edge research projects
- Recipients of national and international awards and recognition
- Active participants in professional societies and conferences

RESEARCH FOCUS AREAS:
- Renewable Energy and Sustainable Development
- Artificial Intelligence and Machine Learning
- Nanotechnology and Materials Science
- Water Resources and Environmental Engineering
- Earthquake Engineering and Structural Dynamics
- Petroleum Engineering and Reservoir Management
- Industrial Automation and Robotics
- Biomedical Engineering and Healthcare Technology

RESEARCH OUTPUT:
The university publishes hundreds of research papers annually in reputed international journals and conferences. Faculty members are actively involved in collaborative research projects with industry partners and international institutions.

RESEARCH FUNDING:
NED University receives research grants from various national and international organizations including:
- Higher Education Commission (HEC) of Pakistan
- Pakistan Science Foundation (PSF)
- International funding agencies
- Industry partnerships and collaborations''',
                        Icons.people,
                        Colors.indigo,
                      ),

                      const SizedBox(height: 20),

                      // Student Life and Activities Card
                      _buildSectionCard(
                        'Vibrant Student Life and Activities',
                        '''Student life at NED University extends far beyond academics, offering a rich tapestry of extracurricular activities, societies, and opportunities for personal development. The university fosters an environment where students can explore their interests, develop leadership skills, and build lifelong friendships.

STUDENT SOCIETIES AND CLUBS:
- Engineering societies for each department
- IEEE Student Branch - one of the most active in Pakistan
- Robotics and Automation Society
- Debate and Literary Society
- Drama and Cultural Society
- Photography Club
- Music Society
- Social Service Society
- Entrepreneurship Development Cell

ANNUAL EVENTS:
- TECHNO: The flagship technical festival showcasing student innovations
- Cultural Week: Celebrating diversity and artistic talents
- Sports Festival: Inter-departmental and inter-university competitions
- Career Fair: Connecting students with industry professionals
- Alumni Reunion: Strengthening bonds with graduates

STUDENT PUBLICATIONS:
- "The NED Voice": Official student magazine
- Technical journals and newsletters
- Digital media platforms managed by students

LEADERSHIP OPPORTUNITIES:
- Student Council elections and governance
- Society executive positions
- Event organization and management
- Peer mentoring programs
- Community service initiatives

SPORTS AND RECREATION:
The university has a strong tradition in sports with teams competing at national and international levels. Facilities include cricket grounds, football fields, basketball courts, tennis courts, and indoor sports facilities.

HOSTEL LIFE:
Campus hostels provide a home away from home for students from across Pakistan and international students. The hostel system promotes cultural exchange and lasting friendships.''',
                        Icons.celebration,
                        Colors.pink,
                      ),

                      const SizedBox(height: 20),

                      // Alumni Network Card
                      _buildSectionCard(
                        'Distinguished Alumni Network',
                        '''NED University's greatest strength lies in its extensive alumni network spanning across the globe. Over the past century, the university has produced more than 50,000 graduates who have made significant contributions to engineering, technology, business, and public service.

NOTABLE ALUMNI:
- Engineers serving in top positions in multinational corporations
- Successful entrepreneurs who have founded technology companies
- Government officials and policy makers
- Academics and researchers in leading universities worldwide
- CEOs and executives of major industrial organizations

GLOBAL PRESENCE:
NED alumni can be found in leadership positions in:
- Silicon Valley tech companies
- Middle Eastern oil and gas industry
- European engineering firms
- Asian manufacturing companies
- Government agencies worldwide

ALUMNI CONTRIBUTIONS:
- Establishment of scholarship funds for deserving students
- Funding for research projects and infrastructure development
- Industry partnerships and internship opportunities
- Guest lectures and knowledge sharing sessions
- Mentorship programs for current students

ALUMNI ASSOCIATIONS:
Active alumni chapters exist in major cities around the world including:
- Karachi, Lahore, and Islamabad in Pakistan
- Dubai and Abu Dhabi in UAE
- London and Manchester in UK
- New York and California in USA
- Toronto in Canada
- Sydney in Australia

These associations organize regular meetups, professional development sessions, and charitable activities, maintaining strong connections with their alma mater.''',
                        Icons.group,
                        Colors.teal,
                      ),

                      const SizedBox(height: 20),

                      // Rankings and Recognition Card
                      _buildSectionCard(
                        'Rankings and International Recognition',
                        '''NED University has consistently maintained its position as one of Pakistan's top engineering institutions and has gained recognition internationally for its academic excellence and research contributions.

NATIONAL RANKINGS:
- Consistently ranked among the top 3 engineering universities in Pakistan
- Recognized by Higher Education Commission (HEC) as a leading institution
- High graduate employability rates
- Strong industry connections and partnerships

INTERNATIONAL RECOGNITION:
- Partnerships with universities in USA, UK, Germany, and other countries
- Student exchange programs with international institutions
- Research collaborations with global universities
- International accreditation for engineering programs

ACCREDITATIONS:
- Pakistan Engineering Council (PEC) accreditation for all engineering programs
- Higher Education Commission (HEC) recognition
- ISO certification for quality management systems
- International partnership agreements

AWARDS AND ACHIEVEMENTS:
- National awards for excellence in engineering education
- Recognition for research contributions
- Awards for community service and social impact
- Industry appreciation for graduate quality

QUALITY ASSURANCE:
The university maintains rigorous quality standards through:
- Regular curriculum updates
- Faculty development programs
- Industry feedback incorporation
- International benchmarking
- Continuous improvement processes''',
                        Icons.star,
                        Colors.amber,
                      ),

                      const SizedBox(height: 20),

                      // Contact Information Card
                      _buildSectionCard(
                        'Contact Information and Location',
                        '''NED University of Engineering & Technology is strategically located in Karachi, the economic hub of Pakistan, providing students with excellent opportunities for internships, industrial visits, and career prospects.

ADDRESS:
NED University of Engineering & Technology
University Road, Karachi - 75270
Sindh, Pakistan

CONTACT DETAILS:
Phone: +92-21-99261261-8
Fax: +92-21-99261255
Email: info@neduet.edu.pk
Website: www.neduet.edu.pk

CAMPUS DIRECTIONS:
The university is easily accessible by public transport and private vehicles. It is located on University Road, near:
- Karachi University
- Dow University of Health Sciences
- National Stadium
- Expo Center Karachi

PUBLIC TRANSPORT:
- Regular bus services from all parts of Karachi
- Qinchi bus rapid transit system connectivity
- Taxi and ride-hailing services available

ADMISSIONS OFFICE:
For admission inquiries:
Phone: +92-21-99261261 Ext. 2173
Email: admissions@neduet.edu.pk

INTERNATIONAL OFFICE:
For international students and collaborations:
Email: international@neduet.edu.pk

CAREER SERVICES:
For career guidance and placement services:
Email: careers@neduet.edu.pk

The university welcomes visitors and conducts regular campus tours for prospective students and their families.''',
                        Icons.contact_mail,
                        Colors.brown,
                      ),

                      const SizedBox(height: 30),

                      // Call to Action
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.deepPurple],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.school,
                              color: Colors.white,
                              size: 50,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Join the NED Legacy',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Be part of a century-old tradition of excellence in engineering education',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to admissions or website
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.purple,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Learn More About Admissions',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
    String title,
    String content,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Updated main app class
class UniversityGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NED University Guide',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('University Guide'),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              NEDUniversityCard(),
              // Add more cards or content here
            ],
          ),
        ),
      ),
    );
  }
}
