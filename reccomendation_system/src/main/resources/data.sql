-- COMPANY TABLE
INSERT INTO company (company_name, image_url) VALUES
('Tata Consultancy Services', 'https://logo.clearbit.com/tcs.com'),
('Infosys', 'https://logo.clearbit.com/infosys.com'),
('Wipro', 'https://logo.clearbit.com/wipro.com'),
('HCL Technologies', 'https://logo.clearbit.com/hcltech.com'),
('Reliance Industries', 'https://logo.clearbit.com/relianceindustries.com'),
('Mahindra & Mahindra', 'https://logo.clearbit.com/mahindra.com'),
('Bajaj Auto', 'https://logo.clearbit.com/bajajauto.com'),
('Maruti Suzuki India', 'https://logo.clearbit.com/marutisuzuki.com'),
('Aditya Birla Group', 'https://logo.clearbit.com/adityabirla.com'),
('ICICI Bank', 'https://logo.clearbit.com/icicibank.com'),
('HDFC Bank', 'https://logo.clearbit.com/hdfcbank.com'),
('State Bank of India', 'https://logo.clearbit.com/sbi.co.in'),
('Axis Bank', 'https://logo.clearbit.com/axisbank.com'),
('Flipkart', 'https://logo.clearbit.com/flipkart.com'),
('Amazon India', 'https://logo.clearbit.com/amazon.in'),
('Paytm', 'https://logo.clearbit.com/paytm.com'),
('Ola Cabs', 'https://logo.clearbit.com/olacabs.com'),
('Zomato', 'https://logo.clearbit.com/zomato.com'),
('Swiggy', 'https://logo.clearbit.com/swiggy.com'),
('Dr. Reddy''s Laboratories', 'https://logo.clearbit.com/drreddys.com'),
('Sun Pharmaceutical', 'https://logo.clearbit.com/sunpharma.com'),
('Biocon', 'https://logo.clearbit.com/biocon.com'),
('Bharat Forge', 'https://logo.clearbit.com/bharatforge.com'),
('Larsen & Toubro', 'https://logo.clearbit.com/larsentoubro.com'),
('Godrej Group', 'https://logo.clearbit.com/godrej.com'),
('ITC Limited', 'https://logo.clearbit.com/itcportal.com'),
('Asian Paints', 'https://logo.clearbit.com/asianpaints.com'),
('Nestle India', 'https://logo.clearbit.com/nestle.in'),
('Cipla', 'https://logo.clearbit.com/cipla.com'),
('Havells India', 'https://logo.clearbit.com/havells.com'),
('Hero MotoCorp', 'https://logo.clearbit.com/heromotocorp.com'),
('Tata Steel', 'https://logo.clearbit.com/tatasteel.com'),
('JSW Steel', 'https://logo.clearbit.com/jsw.in'),
('Bajaj Finserv', 'https://logo.clearbit.com/bajajfinserv.in'),
('Kotak Mahindra Bank', 'https://logo.clearbit.com/kotak.com'),
('Mahindra Logistics', 'https://logo.clearbit.com/mahindra.com'),
('Amazon Web Services', 'https://logo.clearbit.com/aws.amazon.com'),
('Google India', 'https://logo.clearbit.com/google.co.in'),
('Microsoft India', 'https://logo.clearbit.com/microsoft.com'),
('Adobe India', 'https://logo.clearbit.com/adobe.com'),
('Siemens India', 'https://logo.clearbit.com/siemens.com'),
('Bosch India', 'https://logo.clearbit.com/bosch.in'),
('Schneider Electric India', 'https://logo.clearbit.com/se.com'),
('Uber India', 'https://logo.clearbit.com/uber.com'),
('Philips India', 'https://logo.clearbit.com/philips.com'),
('Walmart India', 'https://logo.clearbit.com/walmart.com'),
('Tata Power', 'https://logo.clearbit.com/tatapower.com'),
('Reliance Jio', 'https://logo.clearbit.com/jio.com'),
('BYJU\'s', 'https://logo.clearbit.com/byjus.com'),
('MakeMyTrip', 'https://logo.clearbit.com/makemytrip.com'),
('BigBasket', 'https://logo.clearbit.com/bigbasket.com');

-- INTERNSHIP TABLE
INSERT INTO internship (address_line1, address_line2, applied_count, benefits, block, description, district, duration, field, internship_district, internship_state, location, max_stipend, min_stipend, postal_code, posting_time, sector, state, title, total_count, village, company_id) VALUES
('2nd Floor, Electronics Park','Phase 1',5,'Certificate, Stipend', 'Block A', 'Embedded systems intern supporting sensor integration and firmware validation.', 'Bengaluru Urban', '6 months', 'Embedded Systems', 'Bengaluru Urban', 'Karnataka', 'Electronics Park, Bengaluru', 15000, 8000, '560102', '2025-08-01 09:30:00', 'Technology', 'Karnataka', 'Embedded Systems Intern', 3, 'Koramangala', 1),
('SDF Tower','IT Hub',12,'Certificate, Transport Allowance', 'Block B', 'Frontend development internship to build dashboards using React and REST APIs.', 'Bengaluru Urban', '3 months', 'Frontend Development', 'Bengaluru Urban', 'Karnataka', 'Whitefield, Bengaluru', 12000, 5000, '560066', '2025-08-05 10:00:00', 'Technology', 'Karnataka', 'Frontend Developer Intern', 6, 'Whitefield', 2),
('Plant 3','Production Area',3,'PPE Provided', 'Block C', 'Quality control intern for assembly line testing and reports.', 'Pune', '4 months', 'Quality Assurance', 'Pune', 'Maharashtra', 'Wagholi', 9000, 6000, '412207', '2025-07-25 11:15:00', 'Manufacturing', 'Maharashtra', 'Quality Assurance Intern', 4, 'Wagholi', 3),
('R&D Building','Lab 2',7,'Travel allowance', 'Block D', 'Clinical research support: data entry and lab sample tracking.', 'Hyderabad', '6 months', 'Clinical Research', 'Hyderabad', 'Telangana', 'Madhapur', 16000, 10000, '500081', '2025-08-10 09:00:00', 'Pharma', 'Telangana', 'Clinical Research Intern', 5, 'Madhapur', 20),
('Corporate Office','Floor 5',20,'Certificate, Exposure to Banking', 'Block E', 'Finance intern supporting loan analytics and MIS reports.', 'Mumbai', '3 months', 'Finance', 'Mumbai', 'Maharashtra', 'Andheri East', 18000, 8000, '400093', '2025-08-12 14:00:00', 'Banking', 'Maharashtra', 'Finance Intern', 10, 'Andheri', 11),
('Design Studio','Room 12',4,'Mentorship', 'Block F', 'UI/UX design internship creating high-fidelity prototypes for mobile apps.', 'Gurgaon', '2 months', 'UI/UX', 'Gurgaon', 'Haryana', 'DLF Phase 2', 10000, 6000, '122002', '2025-08-20 10:30:00', 'Design', 'Haryana', 'UI/UX Designer Intern', 3, 'DLF Phase 2', 36),
('Warehouse','Logistics Bay',9,'Travel allowance, certificate', 'Block G', 'Logistics intern: assist in warehousing operations and inventory reconciliation.', 'Bengaluru Rural', '4 months', 'Logistics', 'Bengaluru Rural', 'Karnataka', 'Peenya', 8000, 4000, '560058', '2025-08-22 11:00:00', 'Logistics', 'Karnataka', 'Logistics Intern', 8, 'Peenya', 35),
('Food Tech Lab','Kitchen 1',6,'Meals, Certificate', 'Block H', 'Food technology internship: new product trial, sensory evaluation.', 'Kolkata', '3 months', 'Food Technology', 'Kolkata', 'West Bengal', 'Salt Lake', 12000, 6000, '700064', '2025-08-18 09:45:00', 'Food & Beverage', 'West Bengal', 'Food Technology Intern', 6, 'Salt Lake', 28),
('Corporate HQ','CSR Unit',2,'Certificate', 'Block I', 'CSR intern coordinating rural development outreach programs.', 'Ahmedabad', '6 months', 'Social Development', 'Ahmedabad', 'Gujarat', 'Gota', 7000, 3000, '380060', '2025-08-30 09:00:00', 'Corporate', 'Gujarat', 'CSR Intern', 2, 'Gota', 9),
('Retail Outlet','Store 11',25,'Employee discount', 'Block J', 'Retail operations intern: store merchandising and POS operations.', 'Bengaluru', '2 months', 'Retail', 'Bengaluru Urban', 'Karnataka', 'Brigade Road', 7000, 4000, '560025', '2025-09-01 10:00:00', 'Retail', 'Karnataka', 'Retail Operations Intern', 15, 'Brigade Road', 14),
('Tech Park','Dev Wing',8,'Stipend, Certification', 'Block K', 'Backend intern: Node.js microservices and database integration.', 'Chennai', '3 months', 'Backend Development', 'Chennai', 'Tamil Nadu', 'OMR', 15000, 7000, '600097', '2025-08-03 09:00:00', 'Technology', 'Tamil Nadu', 'Backend Engineer Intern', 7, 'OMR', 36),
('Marketing Office','Floor 3',11,'Letter of Recommendation', 'Block L', 'Digital marketing intern working on SEO & social campaigns.', 'New Delhi', '2 months', 'Digital Marketing', 'New Delhi', 'Delhi', 'Connaught Place', 10000, 5000, '110001', '2025-08-06 11:30:00', 'Marketing', 'Delhi', 'Digital Marketing Intern', 10, 'CP', 15),
('Rural Clinic','Health Hub',3,'Stipend, Travel', 'Block M', 'Community health intern assisting with vaccination drives and records.', 'Patna', '4 months', 'Public Health', 'Patna', 'Bihar', 'Kankarbagh', 6000, 3000, '800020', '2025-08-15 08:30:00', 'Healthcare', 'Bihar', 'Public Health Intern', 3, 'Kankarbagh', 20),
('Agri Research Unit','Field Lab',5,'Field training, certificate', 'Block N', 'Agronomy intern: assist with crop trials and data logging.', 'Anantapur', '6 months', 'Agronomy', 'Anantapur', 'Andhra Pradesh', 'Rural Research Station', 8000, 4000, '515001', '2025-07-28 09:00:00', 'Agriculture', 'Andhra Pradesh', 'Agronomy Intern', 4, 'Rural', 33),
('Manufacturing Plant','Assembly A',14,'Hands-on training', 'Block O', 'Production intern: assist with process optimization and Kaizen activities.', 'Jamshedpur', '5 months', 'Manufacturing', 'Jamshedpur', 'Jharkhand', 'Industrial Area', 11000, 6000, '831001', '2025-08-02 09:00:00', 'Manufacturing', 'Jharkhand', 'Production Intern', 9, 'Industrial Area', 24),
('Clinical Lab','Sample Unit',4,'Exposure to R&D', 'Block P', 'Pharma R&D intern supporting documentation and assay setup.', 'Hyderabad', '6 months', 'Pharma R&D', 'Hyderabad', 'Telangana', 'Gachibowli', 20000, 12000, '500032', '2025-08-11 09:00:00', 'Pharma', 'Telangana', 'R&D Intern', 4, 'Gachibowli', 21),
('Tech Innovation Hub','AI Lab',10,'Stipend, Mentorship', 'Block Q', 'ML intern for model development and data labeling for recommendation systems.', 'Bengaluru', '6 months', 'Machine Learning', 'Bengaluru Urban', 'Karnataka', 'Electronic City', 22000, 10000, '560100', '2025-08-07 10:00:00', 'Technology', 'Karnataka', 'ML Research Intern', 12, 'Electronic City', 38),
('Customer Success','Support Floor',30,'Learning, Letter', 'P Block', 'Customer support intern handling queries and escalation for product users.', 'Noida', '3 months', 'Customer Support', 'Gautam Buddha Nagar', 'Uttar Pradesh', 'Sector 62', 7000, 4000, '201309', '2025-08-14 09:30:00', 'Services', 'Uttar Pradesh', 'Customer Support Intern', 20, 'Sector 62', 15),
('Design Lab','Studio 4',2,'Stipend', 'Q Block', 'Packaging design intern working on FMCG packaging and sustainability.', 'Mumbai', '4 months', 'Packaging Design', 'Mumbai', 'Maharashtra', 'Lower Parel', 9000, 5000, '400013', '2025-08-25 10:00:00', 'FMCG', 'Maharashtra', 'Packaging Design Intern', 2, 'Lower Parel', 26),
('Sales Office','Regional',17,'Commission, Certificate', 'R Block', 'Sales intern: market surveys and field sales for retail expansion.', 'Lucknow', '2 months', 'Sales', 'Lucknow', 'Uttar Pradesh', 'Hazratganj', 10000, 5000, '226001', '2025-08-29 09:00:00', 'Sales', 'Uttar Pradesh', 'Sales Trainee Intern', 15, 'Hazratganj', 14),
('Energy Plant','Operation Floor',5,'Safety Training', 'S Block', 'Energy intern assisting with solar plant maintenance and monitoring.', 'Jodhpur', '6 months', 'Renewable Energy', 'Jodhpur', 'Rajasthan', 'Industrial Estate', 14000, 8000, '342001', '2025-08-04 09:00:00', 'Energy', 'Rajasthan', 'Solar Operations Intern', 4, 'Industrial Estate', 50),
('Logistics Hub','Dispatch Bay',9,'Certificate', 'T Block', 'Dispatch operations intern coordinating last-mile deliveries and route planning.', 'Kochi', '3 months', 'Logistics', 'Ernakulam', 'Kerala', 'Willington Island', 8000, 4000, '682009', '2025-08-09 09:30:00', 'Logistics', 'Kerala', 'Dispatch Coordinator Intern', 7, 'Willington Island', 35),
('Research Wing','Lab 8',6,'Travel Allowance', 'U Block', 'Clinical data analyst intern processing trial data for regulatory submissions.', 'Mumbai', '5 months', 'Clinical Data', 'Mumbai', 'Maharashtra', 'Bandra', 18000, 10000, '400050', '2025-07-30 09:00:00', 'Pharma', 'Maharashtra', 'Clinical Data Intern', 5, 'Bandra', 20),
('Start-up Space','Co-Work 5',4,'Equity Consideration', 'V Block', 'Product management intern aiding in roadmap and user research.', 'Bengaluru', '3 months', 'Product Management', 'Bengaluru Urban', 'Karnataka', 'MG Road', 12000, 7000, '560001', '2025-08-13 09:30:00', 'Startup', 'Karnataka', 'Product Intern', 4, 'MG Road', 34),
('Testing Center','Lab C',3,'Certificate, Training', 'W Block', 'Automotive testing intern for sensor validation and durability tests.', 'Chennai', '4 months', 'Automotive Testing', 'Chennai', 'Tamil Nadu', 'Guindy', 14000, 7000, '600032', '2025-08-16 09:00:00', 'Automobile', 'Tamil Nadu', 'Automotive Testing Intern', 3, 'Guindy', 31),
('E-commerce Office','Vendor Mgmt',20,'Employee discount', 'X Block', 'Vendor onboarding intern supporting seller integration and KYC.', 'Gurgaon', '2 months', 'E-commerce Operations', 'Gurgaon', 'Haryana', 'Sohna Road', 8000, 4000, '122001', '2025-08-21 10:00:00', 'E-commerce', 'Haryana', 'Vendor Operations Intern', 12, 'Sohna Road', 14),
('Hospital','Ward 5',5,'Accommodation', 'Y Block', 'Clinical intern assisting with patient rounds and health records.', 'Thiruvananthapuram', '6 months', 'Clinical', 'Thiruvananthapuram', 'Kerala', 'Medical College Area', 10000, 6000, '695011', '2025-08-17 09:00:00', 'Healthcare', 'Kerala', 'Clinical Intern', 5, 'Medical College Area', 20),
('Agritech Lab','Field Unit',7,'Field Training', 'Z Block', 'Agri-tech intern building sensor-based farm monitoring prototypes.', 'Coimbatore', '4 months', 'Agritech', 'Coimbatore', 'Tamil Nadu', 'Kupandapalayam', 12000, 7000, '641014', '2025-08-24 09:00:00', 'Agriculture', 'Tamil Nadu', 'Agri-Tech Intern', 6, 'Kupandapalayam', 33),
('R&D Center','Material Lab',3,'Stipend, Certificate', 'AA Block', 'Materials intern for steel alloy composition testing and lab reports.', 'Jamshedpur', '6 months', 'Materials Science', 'Jamshedpur', 'Jharkhand', 'Tatanagar', 15000, 9000, '831002', '2025-08-27 09:00:00', 'Steel', 'Jharkhand', 'Materials Research Intern', 3, 'Tatanagar', 30),
('Legal Office','Counsel Wing',2,'Stipend, Exposure', 'AB Block', 'Legal internship assisting with contract review and compliance.', 'Mumbai', '3 months', 'Legal', 'Mumbai', 'Maharashtra', 'Nariman Point', 12000, 7000, '400021', '2025-08-28 09:00:00', 'Legal', 'Maharashtra', 'Legal Intern', 2, 'Nariman Point', 8),
('Analytics Unit','Data Floor',11,'Certificate, mentorship', 'AC Block', 'Business analytics intern: dashboards and cohort analysis for product teams.', 'Pune', '4 months', 'Business Analytics', 'Pune', 'Maharashtra', 'Hinjewadi', 16000, 9000, '411057', '2025-08-19 09:00:00', 'Analytics', 'Maharashtra', 'Business Analytics Intern', 10, 'Hinjewadi', 11),
('CSR Office','Field Ops',4,'Travel Allowance', 'AD Block', 'Rural internship designing skilling programs for smallholder farmers.', 'Bhopal', '6 months', 'Rural Development', 'Bhopal', 'Madhya Pradesh', 'Raisen Road', 7000, 3000, '462016', '2025-08-23 09:00:00', 'Social', 'Madhya Pradesh', 'Field Program Intern', 3, 'Raisen Road', 9),
('Product Lab','Mobile Dev',8,'Stipend, mentorship', 'AE Block', 'Mobile app intern building Flutter cross-platform features and testing.', 'Bengaluru', '3 months', 'Mobile Development', 'Bengaluru Urban', 'Karnataka', 'Basavanagudi', 13000, 7000, '560004', '2025-08-26 10:00:00', 'Technology', 'Karnataka', 'Flutter Developer Intern', 7, 'Basavanagudi', 38),
('Retail HQ','Buyer Desk',6,'Exposure to category mgmt', 'AF Block', 'Merchandising intern analyzing SKU performance and planograms.', 'Surat', '2 months', 'Merchandising', 'Surat', 'Gujarat', 'Ring Road', 8000, 5000, '395002', '2025-08-31 09:00:00', 'Retail', 'Gujarat', 'Merchandising Intern', 6, 'Ring Road', 26),
('Industrial Lab','Process Unit',5,'Stipend, Training', 'AG Block', 'Process intern for chemical plant operations and safety audits.', 'Vadodara', '5 months', 'Chemical Engineering', 'Vadodara', 'Gujarat', 'GIDC', 14000, 8000, '390012', '2025-07-31 09:00:00', 'Chemicals', 'Gujarat', 'Process Engineering Intern', 5, 'GIDC', 20),
('Rural Clinic','Field Office',3,'Travel Allowance', 'AH Block', 'Nutrition intern focusing on community diet assessments and counseling.', 'Raipur', '4 months', 'Nutrition', 'Raipur', 'Chhattisgarh', 'Civil Lines', 7000, 3000, '492001', '2025-08-08 09:00:00', 'Healthcare', 'Chhattisgarh', 'Nutrition Intern', 3, 'Civil Lines', 20),
('AI Lab','Research Wing',9,'Stipend, Mentorship', 'AI Block', 'NLP intern for text classification, data augmentation and evaluation.', 'Hyderabad', '6 months', 'NLP', 'Hyderabad', 'Telangana', 'Hitec City', 22000, 10000, '500081', '2025-08-01 09:00:00', 'AI', 'Telangana', 'NLP Research Intern', 7, 'Hitec City', 38),
('Operations HQ','Client Services',18,'Certificate', 'AJ Block', 'Operations intern: SLA monitoring, vendor coordination and reporting.', 'Bengaluru', '3 months', 'Operations', 'Bengaluru Urban', 'Karnataka', 'Kalyan Nagar', 8000, 4000, '560043', '2025-08-05 09:00:00', 'Services', 'Karnataka', 'Operations Intern', 13, 'Kalyan Nagar', 15),
('Testing Facility','QA Lab',4,'Stipend, Letter', 'AK Block', 'Software QA intern for automated test scripts using Selenium.', 'Noida', '3 months', 'QA', 'Gautam Buddha Nagar', 'Uttar Pradesh', 'Sector 18', 10000, 6000, '201301', '2025-08-10 10:00:00', 'Technology', 'Uttar Pradesh', 'QA Automation Intern', 5, 'Sector 18', 2),
('Investor Relations','Office 7',2,'Exposure to finance team', 'AL Block', 'Investor research intern preparing pitch decks and market research.', 'Mumbai', '2 months', 'Finance Research', 'Mumbai', 'Maharashtra', 'Nariman Point', 15000, 8000, '400021', '2025-08-12 09:00:00', 'Finance', 'Maharashtra', 'IR Analyst Intern', 2, 'Nariman Point', 11),
('Sustainability Office','Green Unit',3,'Certificate, Field Visits', 'AM Block', 'Sustainability intern: carbon footprint assessment and reporting.', 'Pune', '4 months', 'Sustainability', 'Pune', 'Maharashtra', 'Baner', 12000, 7000, '411045', '2025-08-14 09:30:00', 'Corporate', 'Maharashtra', 'Sustainability Intern', 3, 'Baner', 30),
('Manufacturing Plant','Tool Room',6,'Hands-on Training', 'AN Block', 'Tool design intern for jigs and fixtures CAD design.', 'Chennai', '5 months', 'Mechanical Design', 'Chennai', 'Tamil Nadu', 'Ambattur', 11000, 6000, '600098', '2025-08-16 09:00:00', 'Manufacturing', 'Tamil Nadu', 'Mechanical Design Intern', 6, 'Ambattur', 3),
('Clinical Trials','Trial Unit',2,'Stipend, Ethics exposure', 'AO Block', 'Clinical trials intern coordinating patient consent and trial logistics.', 'Bengaluru', '6 months', 'Clinical Trials', 'Bengaluru Urban', 'Karnataka', 'Jayanagar', 18000, 10000, '560041', '2025-08-18 09:00:00', 'Pharma', 'Karnataka', 'Clinical Trials Intern', 2, 'Jayanagar', 20),
('Policy Lab','Research Unit',4,'Mentorship', 'AP Block', 'Policy research intern analyzing urban policy case studies and datasets.', 'New Delhi', '3 months', 'Public Policy', 'New Delhi', 'Delhi', 'Habitat Centre', 10000, 6000, '110003', '2025-08-20 09:00:00', 'Policy', 'Delhi', 'Policy Research Intern', 3, 'Habitat Centre', 29),
('Hardware Lab','Prototype Bay',3,'Stipend, Prototype tools', 'AQ Block', 'IoT intern building end-to-end sensor-to-cloud prototypes.', 'Bengaluru', '4 months', 'IoT', 'Bengaluru Urban', 'Karnataka', 'J P Nagar', 14000, 8000, '560078', '2025-08-22 09:00:00', 'Technology', 'Karnataka', 'IoT Intern', 3, 'JP Nagar', 1),
('Brand Office','Creative Hub',7,'Stipend, Exposure', 'AR Block', 'Brand intern: campaign ideation, social strategy and content calendars.', 'Mumbai', '2 months', 'Brand Management', 'Mumbai', 'Maharashtra', 'Bandra Kurla Complex', 12000, 7000, '400051', '2025-08-24 09:30:00', 'Marketing', 'Maharashtra', 'Brand Intern', 6, 'BKC', 26),
('Analytics Lab','BI Unit',5,'Certificate', 'AS Block', 'BI intern creating ETL pipelines and PowerBI dashboards for stakeholders.', 'Hyderabad', '4 months', 'BI', 'Hyderabad', 'Telangana', 'Gachibowli', 16000, 9000, '500032', '2025-08-26 09:00:00', 'Analytics', 'Telangana', 'BI Intern', 5, 'Gachibowli', 11),
('Retail Store','Store 32',18,'Employee discount', 'AT Block', 'Customer experience intern collecting NPS and improving store UX.', 'Kolkata', '2 months', 'Customer Experience', 'Kolkata', 'West Bengal', 'Park Street', 6000, 3000, '700016', '2025-08-28 10:00:00', 'Retail', 'West Bengal', 'Customer Experience Intern', 12, 'Park Street', 14),
('Power Plant','Operations',3,'Safety Training', 'AU Block', 'Power generation intern assisting with substation checks and monitoring.', 'Nagpur', '6 months', 'Power Systems', 'Nagpur', 'Maharashtra', 'MIHAN', 15000, 9000, '440016', '2025-08-30 09:00:00', 'Energy', 'Maharashtra', 'Power Systems Intern', 3, 'MIHAN', 50),
('Research Center','Urban Lab',6,'Stipend, Field Work', 'AV Block', 'Urban planning intern supporting GIS mapping and stakeholder consultations.', 'Bengaluru', '4 months', 'Urban Planning', 'Bengaluru Urban', 'Karnataka', 'Koramangala', 12000, 7000, '560034', '2025-09-01 09:00:00', 'Urban Planning', 'Karnataka', 'Urban Planning Intern', 5, 'Koramangala', 30),
('Hotel','Food & Beverage',4,'Accommodation, Meals', 'AW Block', 'F&B intern rotating across kitchens, banquets and cost control.', 'Goa', '3 months', 'Hospitality', 'North Goa', 'Goa', 'Panaji', 12000, 7000, '403001', '2025-08-02 09:00:00', 'Hospitality', 'Goa', 'F&B Intern', 4, 'Panaji', 37),
('Tech Hub','Data Ops',9,'Stipend, Certification', 'AX Block', 'Data engineering intern: build pipelines, schedule ETL and monitor jobs.', 'Bengaluru', '6 months', 'Data Engineering', 'Bengaluru Urban', 'Karnataka', 'Hebbal', 21000, 12000, '560024', '2025-08-04 09:00:00', 'Technology', 'Karnataka', 'Data Engineering Intern', 8, 'Hebbal', 38),
('Manufacturing Unit','Maintenance',7,'Hands-on training', 'AY Block', 'Maintenance intern assisting with predictive maintenance schedule and logs.', 'Pune', '4 months', 'Maintenance Engineering', 'Pune', 'Maharashtra', 'Hadapsar', 10000, 6000, '411028', '2025-08-07 09:00:00', 'Manufacturing', 'Maharashtra', 'Maintenance Intern', 6, 'Hadapsar', 3),
('Biotech Lab','Cell Culture',3,'Stipend, Lab Exposure', 'AZ Block', 'Molecular biology intern supporting PCR workflows and sample prep.', 'Bengaluru', '6 months', 'Molecular Biology', 'Bengaluru Urban', 'Karnataka', 'J P Nagar', 20000, 12000, '560078', '2025-08-09 09:00:00', 'Biotech', 'Karnataka', 'Molecular Biology Intern', 3, 'JP Nagar', 21),
('Supply Chain Office','Logistics',10,'Certificate', 'BA Block', 'Supply chain intern mapping supplier network and ETA improvements.', 'Chennai', '3 months', 'Supply Chain', 'Chennai', 'Tamil Nadu', 'Nungambakkam', 12000, 7000, '600034', '2025-08-11 09:00:00', 'Logistics', 'Tamil Nadu', 'Supply Chain Intern', 9, 'Nungambakkam', 35),
('Quality Lab','QA Floor',4,'Stipend, Certificate', 'BB Block', 'Pharma quality intern performing stability study monitoring and reporting.', 'Ahmedabad', '6 months', 'Quality Control', 'Ahmedabad', 'Gujarat', 'GIDC', 16000, 10000, '382445', '2025-08-13 09:00:00', 'Pharma', 'Gujarat', 'Quality Control Intern', 4, 'GIDC', 21),
('Creative Studio','Content Unit',6,'Portfolio Work', 'BC Block', 'Content creation intern producing social-first video and graphics.', 'Mumbai', '2 months', 'Content Creation', 'Mumbai', 'Maharashtra', 'Lower Parel', 9000, 5000, '400013', '2025-08-15 10:00:00', 'Media', 'Maharashtra', 'Content Intern', 6, 'Lower Parel', 18),
('Analytics Hub','Research',3,'Stipend', 'BD Block', 'Economics research intern working on household survey analysis and microdata.', 'New Delhi', '4 months', 'Economics Research', 'New Delhi', 'Delhi', 'JNU Area', 11000, 7000, '110067', '2025-08-17 09:00:00', 'Research', 'Delhi', 'Research Intern', 3, 'JNU Area', 31),
('Engineering Office','Process Floor',5,'Training, Safety', 'BE Block', 'Welding process intern assisting with fixture design and testing.', 'Faridabad', '4 months', 'Welding Engineering', 'Faridabad', 'Haryana', 'Industrial Area', 9000, 5000, '121001', '2025-08-19 09:00:00', 'Manufacturing', 'Haryana', 'Welding Intern', 4, 'Industrial Area', 24),
('Healthcare Center','Diagnostics',7,'Clinical Exposure', 'BF Block', 'Diagnostics intern supporting sample collection, preprocessing and logs.', 'Kolkata', '3 months', 'Diagnostics', 'Kolkata', 'West Bengal', 'Tollygunge', 8000, 4000, '700040', '2025-08-21 09:00:00', 'Healthcare', 'West Bengal', 'Diagnostics Intern', 7, 'Tollygunge', 20),
('Urban Lab','Sociology',4,'Fieldwork, stipend', 'BG Block', 'Sociology intern performing qualitative interviews for urban livelihood study.', 'Bengaluru', '3 months', 'Sociology Research', 'Bengaluru Urban', 'Karnataka', 'Jayanagar', 7000, 3000, '560041', '2025-08-23 09:00:00', 'Research', 'Karnataka', 'Field Research Intern', 4, 'Jayanagar', 29),
('Design Studio','Industrial Design',3,'Prototype Budget', 'BH Block', 'Product design intern producing physical prototypes and user testing reports.', 'Pune', '4 months', 'Industrial Design', 'Pune', 'Maharashtra', 'Kothrud', 14000, 8000, '411029', '2025-08-25 09:00:00', 'Design', 'Maharashtra', 'Industrial Design Intern', 3, 'Kothrud', 17),
('Corporate Office','Analytics Team',6,'Certificate', 'BI Block', 'Risk analytics intern modeling credit risk and stress-testing scenarios.', 'Mumbai', '3 months', 'Risk Analytics', 'Mumbai', 'Maharashtra', 'Bandra', 18000, 10000, '400050', '2025-08-27 09:00:00', 'Finance', 'Maharashtra', 'Risk Analytics Intern', 5, 'Bandra', 11),
('R&D Facility','Chem Lab',4,'Stipend, PPE', 'BJ Block', 'Polymer chemistry intern assisting with formulation trials and rheology tests.', 'Vadodara', '5 months', 'Polymer Chemistry', 'Vadodara', 'Gujarat', 'Science City', 14000, 8000, '390001', '2025-08-29 09:00:00', 'Chemicals', 'Gujarat', 'Polymer Chemistry Intern', 4, 'Science City', 30),
('HR Office','Campus Hiring',10,'Stipend, Letter', 'BK Block', 'HR intern supporting campus hiring process, scheduling interviews and screening.', 'Bengaluru', '2 months', 'HR Operations', 'Bengaluru Urban', 'Karnataka', 'Whitefield', 9000, 5000, '560066', '2025-08-31 09:00:00', 'HR', 'Karnataka', 'HR Operations Intern', 8, 'Whitefield', 1),
('Agri Lab','Soil Testing',3,'Field Visits', 'BL Block', 'Soil science intern performing sampling and lab nutrient analysis.', 'Ahmednagar', '4 months', 'Soil Science', 'Ahmednagar', 'Maharashtra', 'Rural Labs', 7000, 3000, '414001', '2025-07-29 09:00:00', 'Agriculture', 'Maharashtra', 'Soil Science Intern', 3, 'Rural Labs', 33),
('Supply Office','Procurement',5,'Certificate', 'BM Block', 'Procurement intern analyzing supplier contracts and delivery timelines.', 'Surat', '3 months', 'Procurement', 'Surat', 'Gujarat', 'Varachha', 10000, 6000, '395006', '2025-07-31 09:00:00', 'Supply Chain', 'Gujarat', 'Procurement Intern', 4, 'Varachha', 26),
('Clinical Research Center','Pharmacovigilance',4,'Stipend, Training', 'BN Block', 'Pharmacovigilance intern: adverse event reporting and database updates.', 'Hyderabad', '6 months', 'Pharmacovigilance', 'Hyderabad', 'Telangana', 'Secunderabad', 16000, 10000, '500003', '2025-08-02 09:00:00', 'Pharma', 'Telangana', 'Pharmacovigilance Intern', 4, 'Secunderabad', 21),
('EdTech Lab','Content Dev',6,'Mentorship', 'BO Block', 'Instructional design intern building course modules and assessments.', 'Bengaluru', '3 months', 'Instructional Design', 'Bengaluru Urban', 'Karnataka', 'Indiranagar', 9000, 5000, '560038', '2025-08-04 09:00:00', 'EdTech', 'Karnataka', 'Instructional Design Intern', 5, 'Indiranagar', 34),
('Green Energy','Site Office',3,'Field Safety', 'BP Block', 'Wind energy intern supporting turbine inspection and SCADA monitoring.', 'Kutch', '6 months', 'Wind Energy', 'Kutch', 'Gujarat', 'Gandhidham', 15000, 9000, '370201', '2025-08-06 09:00:00', 'Energy', 'Gujarat', 'Wind Operations Intern', 3, 'Gandhidham', 50),
('UX Lab','User Research',4,'Stipend', 'BQ Block', 'User research intern running usability tests and synthesizing findings.', 'Bengaluru', '2 months', 'User Research', 'Bengaluru Urban', 'Karnataka', 'Koramangala', 10000, 6000, '560034', '2025-08-08 09:00:00', 'Design', 'Karnataka', 'User Research Intern', 4, 'Koramangala', 17),
('Mobile Lab','QA',5,'Certificate', 'BR Block', 'Mobile QA intern testing app compatibility across devices and regression.', 'Gurgaon', '3 months', 'Mobile QA', 'Gurgaon', 'Haryana', 'DLF Cyber City', 9000, 5000, '122002', '2025-08-10 09:00:00', 'Technology', 'Haryana', 'Mobile QA Intern', 5, 'Cyber City', 36),
('Packaging Unit','Sustainable Pack',3,'Stipend', 'BS Block', 'Sustainable packaging intern researching compostable materials and cost.', 'Navi Mumbai', '3 months', 'Sustainable Packaging', 'Navi Mumbai', 'Maharashtra', 'Vashi', 9000, 5000, '400703', '2025-08-12 09:00:00', 'FMCG', 'Maharashtra', 'Packaging Sustainability Intern', 3, 'Vashi', 26),
('Field Office','Extension Services',4,'Travel', 'BT Block', 'Extension intern supporting farmer workshops and demonstration plots.', 'Beed', '6 months', 'Agricultural Extension', 'Beed', 'Maharashtra', 'Rural Block', 6000, 3000, '431122', '2025-08-14 09:00:00', 'Agriculture', 'Maharashtra', 'Extension Intern', 3, 'Rural Block', 33),
('Biomedical Lab','Device Testing',3,'Stipend', 'BU Block', 'Biomedical intern testing medical device performance and calibration.', 'Bengaluru', '4 months', 'Biomedical Engineering', 'Bengaluru Urban', 'Karnataka', 'Peenya', 14000, 8000, '560058', '2025-08-16 09:00:00', 'Medical Devices', 'Karnataka', 'Biomedical Intern', 3, 'Peenya', 39),
('Research Office','Policy Unit',2,'Stipend', 'BV Block', 'Policy intern working on education policy case studies and evidence briefs.', 'Patna', '3 months', 'Education Policy', 'Patna', 'Bihar', 'Patna Sahib', 8000, 4000, '800001', '2025-08-18 09:00:00', 'Policy', 'Bihar', 'Policy Intern', 2, 'Patna Sahib', 29),
('Agri Startup','Field Ops',5,'Field Visits', 'BW Block', 'Supply chain intern optimizing farm-to-market logistics for perishables.', 'Nashik', '4 months', 'Agri Supply Chain', 'Nashik', 'Maharashtra', 'Deolali', 10000, 6000, '422001', '2025-08-20 09:00:00', 'AgriTech', 'Maharashtra', 'Agri Supply Chain Intern', 4, 'Deolali', 33),
('R&D Unit','AI Safety',3,'Stipend', 'BX Block', 'AI ethics intern mapping model risks and recommending guardrails.', 'Bengaluru', '6 months', 'AI Ethics', 'Bengaluru Urban', 'Karnataka', 'Koramangala', 22000, 12000, '560034', '2025-08-22 09:00:00', 'AI', 'Karnataka', 'AI Ethics Intern', 3, 'Koramangala', 38),
('Telecom Lab','Network Ops',6,'Training', 'BY Block', 'Network operations intern assisting with 5G site testing and throughput reports.', 'Mumbai', '4 months', 'Telecom', 'Mumbai', 'Maharashtra', 'Andheri', 15000, 9000, '400053', '2025-08-24 09:00:00', 'Telecom', 'Maharashtra', 'Network Ops Intern', 5, 'Andheri', 40),
('Clinical Unit','Bioinformatics',4,'Stipend', 'BZ Block', 'Bioinformatics intern performing sequence analysis and annotation.', 'Hyderabad', '6 months', 'Bioinformatics', 'Hyderabad', 'Telangana', 'HITEC City', 20000, 12000, '500081', '2025-08-26 09:00:00', 'Biotech', 'Telangana', 'Bioinformatics Intern', 3, 'HITEC City', 21),
('Operations Hub','Fleet Mgmt',7,'Certificate', 'CA Block', 'Fleet intern optimizing route assignments and telematics data.', 'Kochi', '3 months', 'Fleet Management', 'Ernakulam', 'Kerala', 'Kakkanad', 9000, 5000, '682030', '2025-08-28 09:30:00', 'Logistics', 'Kerala', 'Fleet Management Intern', 6, 'Kakkanad', 35),
('Kiosk','Customer Service',14,'Training', 'CB Block', 'On-field customer service intern for payments and merchant support.', 'Indore', '2 months', 'Field Support', 'Indore', 'Madhya Pradesh', 'MG Road', 7000, 4000, '452001', '2025-08-30 09:00:00', 'Fintech', 'Madhya Pradesh', 'Field Support Intern', 12, 'MG Road', 16),
('R&D Lab','Sensors',3,'Stipend, Lab Safety', 'CC Block', 'Sensor intern working on calibration and signal conditioning experiments.', 'Coimbatore', '4 months', 'Sensors', 'Coimbatore', 'Tamil Nadu', 'Peelamedu', 12000, 7000, '641004', '2025-09-01 09:00:00', 'Electronics', 'Tamil Nadu', 'Sensors Intern', 3, 'Peelamedu', 1),
('Academics','Teaching Assist',6,'TAship, Stipend', 'CD Block', 'TA intern assisting undergraduate lab sessions and grading.', 'Guwahati', '6 months', 'Teaching Assistant', 'Guwahati', 'Assam', 'Gauhati University', 8000, 4000, '781014', '2025-09-03 09:00:00', 'Education', 'Assam', 'Teaching Assistant Intern', 5, 'GU Campus', 31),
('Field Research','Survey Unit',4,'Travel Allowance', 'CE Block', 'Market research intern conducting consumer surveys and focus groups.', 'Surat', '2 months', 'Market Research', 'Surat', 'Gujarat', 'Athwa', 9000, 5000, '395007', '2025-09-05 09:00:00', 'Market Research', 'Gujarat', 'Market Research Intern', 4, 'Athwa', 26),
('Manufacturing','Product Dev',5,'Stipend', 'CF Block', 'Product intern supporting prototype testing and BOM management.', 'Vishakhapatnam', '4 months', 'Product Development', 'Visakhapatnam', 'Andhra Pradesh', 'Gajuwaka', 11000, 7000, '530026', '2025-09-07 09:00:00', 'Manufacturing', 'Andhra Pradesh', 'Product Development Intern', 4, 'Gajuwaka', 24),
('Healthcare','Telemedicine',8,'Certificate', 'CG Block', 'Telemedicine intern supporting remote consult scheduling and triage.', 'Bengaluru', '3 months', 'Telehealth', 'Bengaluru Urban', 'Karnataka', 'Indiranagar', 9000, 5000, '560038', '2025-09-09 09:00:00', 'Healthcare', 'Karnataka', 'Telemedicine Intern', 7, 'Indiranagar', 20),
('Rural Hub','Livelihoods',3,'Stipend', 'CH Block', 'Livelihoods intern designing skill development modules for artisans.', 'Khammam', '6 months', 'Livelihoods', 'Khammam', 'Telangana', 'Rural Block', 7000, 3000, '507001', '2025-09-11 09:00:00', 'Social', 'Telangana', 'Livelihoods Intern', 3, 'Rural Block', 9),
('Hardware Shop','Assembly',6,'Stipend', 'CI Block', 'Hardware assembly intern working with PCB population and testing.', 'Bengaluru', '3 months', 'PCB Assembly', 'Bengaluru Urban', 'Karnataka', 'Koramangala', 9000, 5000, '560034', '2025-09-13 09:00:00', 'Electronics', 'Karnataka', 'PCB Assembly Intern', 6, 'Koramangala', 1),
('UX Studio','Prototyping',4,'Stipend', 'CJ Block', 'Prototype intern building clickable prototypes and user flows.', 'Pune', '2 months', 'Prototyping', 'Pune', 'Maharashtra', 'Kalyani Nagar', 9000, 5000, '411006', '2025-09-15 09:00:00', 'Design', 'Maharashtra', 'Prototyping Intern', 4, 'Kalyani Nagar', 17),
('AI Lab','CV Team',5,'Stipend', 'CK Block', 'Computer Vision intern working on object detection and annotation pipelines.', 'Hyderabad', '6 months', 'Computer Vision', 'Hyderabad', 'Telangana', 'Gachibowli', 22000, 12000, '500032', '2025-09-17 09:00:00', 'AI', 'Telangana', 'Computer Vision Intern', 5, 'Gachibowli', 38),
('Corporate','Strategy',2,'Exposure, Mentorship', 'CL Block', 'Strategy intern performing competitive analysis and market sizing.', 'Mumbai', '3 months', 'Strategy', 'Mumbai', 'Maharashtra', 'Bandra', 18000, 10000, '400050', '2025-09-19 09:00:00', 'Corporate', 'Maharashtra', 'Strategy Intern', 2, 'Bandra', 11),
('Innovation Hub','Floor 3',5,'Certificate, Mentorship','CH Block','AI intern assisting with model training and evaluation for NLP tasks.','Bengaluru','6 months','Artificial Intelligence','Bengaluru Urban','Karnataka','Whitefield',25000,15000,'560066','2025-09-28 09:00:00','Technology','Karnataka','AI Intern',5,'Whitefield',39),
('Biotech Facility','Lab 2',3,'Stipend, Lab Access','CI Block','Biotech intern supporting CRISPR experiments and data analysis.','Hyderabad','6 months','Biotechnology','Hyderabad','Telangana','Gachibowli',22000,12000,'500032','2025-09-28 10:30:00','Biotech','Telangana','Biotech Research Intern',3,'Gachibowli',40),
('Retail Center','Store 5',10,'Employee Discount, Certificate','CJ Block','Retail management intern handling inventory, merchandising, and POS operations.','Mumbai','3 months','Retail Management','Mumbai','Maharashtra','Andheri',10000,5000,'400093','2025-09-29 09:00:00','Retail','Maharashtra','Retail Management Intern',8,'Andheri',41),
('Manufacturing Hub','Assembly Line','6','Hands-on Training, Safety','CK Block','Production intern supporting process improvement and assembly line monitoring.','Pune','4 months','Manufacturing','Pune','Maharashtra','Hinjewadi',15000,9000,'411057','2025-09-27 09:00:00','Manufacturing','Maharashtra','Production Intern',6,'Hinjewadi',42),
('Tech Lab','Dev Wing','8','Stipend, Certificate','CL Block','Full-stack developer intern working on MERN stack web applications.','Chennai','3 months','Full-Stack Development','Chennai','Tamil Nadu','OMR',18000,10000,'600097','2025-09-26 09:00:00','Technology','Tamil Nadu','Full-Stack Developer Intern',8,'OMR',43),
('Hospital','Ward 3','4','Accommodation, Training','CM Block','Healthcare intern assisting with patient monitoring, vitals recording, and documentation.','Kochi','6 months','Healthcare','Ernakulam','Kerala','Willington Island',12000,7000,'682009','2025-09-25 09:30:00','Healthcare','Kerala','Healthcare Intern',4,'Willington Island',44),
('Agri Innovation Center','Field Lab','5','Field Visits, Certificate','CN Block','Agritech intern assisting with IoT-based soil monitoring and crop data collection.','Nashik','4 months','Agritech','Nashik','Maharashtra','Deolali',14000,8000,'422001','2025-09-24 09:00:00','Agriculture','Maharashtra','Agritech Intern',5,'Deolali',45),
('Design Studio','Creative Unit','3','Portfolio, Mentorship','CO Block','Industrial design intern creating product prototypes and user experience testing.','Bengaluru','3 months','Industrial Design','Bengaluru Urban','Karnataka','Koramangala',12000,7000,'560034','2025-09-23 09:00:00','Design','Karnataka','Industrial Design Intern',3,'Koramangala',46);

-- APP_USER TABLE

INSERT INTO app_user(id, age, district, email, experience, gender, name, percentage, specialization, state, stream, highest_qualification_rank) VALUES
(1,18,'Kolkata','avinash.poddar@example.com',0,'Male','Avinash Poddar',87.4,'Physics-Chemistry-Math','West Bengal','High School Science',2),
(2,19,'Jaipur','neha.sharma@example.com',0,'Female','Neha Sharma',89.2,'Biology','Rajasthan','High School Science',2),
(3,22,'Bengaluru','pranav.kumar@example.com',2,'Male','Pranav Kumar',74.5,'Computer Science','Karnataka','B.Tech',3),
(4,24,'Hyderabad','swarna.mehta@example.com',3.5,'Female','Swarna Mehta',78.6,'Data Science','Telangana','M.Tech',4),
(5,26,'Thiruvananthapuram','adi.nair@example.com',4,'Male','Adithya Nair',81.3,'Mechanical Engineering','Kerala','B.Tech',3),
(6,28,'Ahmedabad','meera.patel@example.com',5.2,'Female','Meera Patel',85,'Business Administration','Gujarat','MBA',4),
(7,30,'Lucknow','ravi.singh@example.com',7,'Male','Ravi Singh',69.8,'Electrical Engineering','Uttar Pradesh','B.Tech',3),
(8,32,'New Delhi','isha.jain@example.com',8,'Female','Isha Jain',88.1,'Law','Delhi','LLM',4),
(9,29,'Chennai','karthik.r@example.com',6.5,'Male','Karthik R',77,'Civil Engineering','Tamil Nadu','B.Tech',3),
(10,21,'Gurgaon','ananya.gupta@example.com',1,'Female','Ananya Gupta',91.2,'Computer Science','Haryana','B.Tech',3),
(11,23,'Patna','sachin.yadav@example.com',1.5,'Male','Sachin Yadav',72.4,'Agriculture','Bihar','BSc Agriculture',3),
(12,20,'Mysore','kavya.rani@example.com',0.5,'Female','Kavya Rani',83,'Commerce','Karnataka','High School Commerce',2),
(13,27,'Indore','pooja.kumar@example.com',4,'Female','Pooja Kumar',80.5,'Human Resources','Madhya Pradesh','MBA HR',4),
(14,25,'Noida','aman.verma@example.com',3,'Male','Aman Verma',75.2,'Finance','Uttar Pradesh','B.Com',3),
(15,31,'Kochi','deepika.nair@example.com',9,'Female','Deepika Nair',92.4,'Biotechnology','Kerala','PhD Biotechnology',5),
(16,34,'Vellore','suresh.p@example.com',10.5,'Male','Suresh P',70.6,'Pharmacy','Tamil Nadu','B.Pharm',3),
(17,35,'Bengaluru','latha.m@example.com',12,'Female','Latha M',86.7,'Design','Karnataka','M.Des',4),
(18,22,'Pune','tarun.rathod@example.com',1,'Male','Tarun Rathod',79.1,'Electronics','Maharashtra','B.Tech',3),
(19,24,'Kolkata','ishita.bose@example.com',2,'Female','Ishita Bose',90,'Journalism','West Bengal','MA Journalism',4),
(20,23,'Bhopal','rahul.jain@example.com',1.8,'Male','Rahul Jain',76.3,'Chemical Engineering','Madhya Pradesh','B.Tech',3),
(21,28,'Kanpur','neelam.verma@example.com',4.5,'Female','Neelam Verma',84,'Clinical Psychology','Uttar Pradesh','M.Sc Psychology',4),
(22,19,'Shimla','manish.thakur@example.com',0,'Male','Manish Thakur',91.5,'NA','Himachal Pradesh','High School General',1),
(23,26,'Mangalore','shruti.shetty@example.com',3.8,'Female','Shruti Shetty',82.2,'Computer Applications','Karnataka','BCA',3),
(24,27,'Raipur','vikram.singh@example.com',5.5,'Male','Vikram Singh',73.9,'Mining Engineering','Chhattisgarh','B.Tech',3),
(25,29,'Vadodara','pallavi.patel@example.com',6,'Female','Pallavi Patel',88.3,'Pharmaceutical Management','Gujarat','MBA Pharma',4),
(26,33,'Kozhikode','rahul.suresh@example.com',11,'Male','Rahul Suresh',87,'Environmental Science','Kerala','MSc Environmental Science',4),
(27,21,'Visakhapatnam','sakshi.rao@example.com',0.6,'Female','Sakshi Rao',78.9,'Marine Biology','Andhra Pradesh','BSc Biology',3),
(28,22,'Surat','aditya.patel@example.com',1.2,'Male','Aditya Patel',80,'Textile Engineering','Gujarat','B.Tech',3),
(29,24,'Chandigarh','ritu.malhotra@example.com',2.5,'Female','Ritu Malhotra',89.7,'Public Policy','Punjab','MA Public Policy',4),
(30,30,'Nagpur','vikas.agarwal@example.com',7.4,'Male','Vikas Agarwal',71.1,'Automobile Engineering','Maharashtra','B.Tech',3),
(31,36,'Kolkata','anjali.das@example.com',12.5,'Female','Anjali Das',93.4,'Economics','West Bengal','PhD Economics',5),
(32,40,'Delhi','sanjay.gupta@example.com',15,'Male','Sanjay Gupta',85.5,'Operations Management','Delhi','MBA',4),
(33,45,'Ahmednagar','reena.k@example.com',20,'Female','Reena K',78.2,'Education','Maharashtra','B.Ed',3),
(34,27,'Rajkot','chirag.patel@example.com',4.2,'Male','Chirag Patel',77.8,'Civil Engineering','Gujarat','B.Tech',3),
(35,22,'Pune','shraddha.pawar@example.com',1,'Female','Shraddha Pawar',86,'Information Technology','Maharashtra','B.Sc IT',3),
(36,24,'Guwahati','aman.kapoor@example.com',3,'Male','Aman Kapoor',88.8,'Marketing','Assam','MBA Marketing',4),
(37,26,'Ernakulam','divya.nair@example.com',4.5,'Female','Divya Nair',79.5,'Hospitality','Kerala','BHM',3),
(38,23,'Kurnool','kumar.s@example.com',2,'Male','Kumar S',74.4,'IT & Networking','Andhra Pradesh','B.Tech',3),
(39,21,'Dharamsala','mansi.kumar@example.com',0.4,'Female','Mansi Kumar',82.1,'Commerce','Himachal Pradesh','High School Commerce',2),
(40,25,'Aurangabad','rahul.bendre@example.com',3.6,'Male','Rahul Bendre',76,'Biotech','Maharashtra','B.Sc Biotechnology',3),
(41,28,'Aligarh','nazima.khan@example.com',5,'Female','Nazima Khan',84.7,'Sociology','Uttar Pradesh','MA Sociology',4),
(42,22,'Jabalpur','yash.rao@example.com',1,'Male','Yash Rao',81.2,'Statistics','Madhya Pradesh','B.Sc Statistics',3),
(43,29,'Varanasi','pooja.singh@example.com',6.5,'Female','Pooja Singh',90.1,'Clinical Research','Uttar Pradesh','MSc Clinical Research',4),
(44,20,'Bikaner','tarini.jain@example.com',0.2,'Female','Tarini Jain',95,'NA','Rajasthan','High School General',1),
(45,18,'Kolkata','avinash.poddar@example.com',0,'Male','Avinash Poddar',87.4,'Physics-Chemistry-Math','West Bengal','High School Science',2),
(46,18,'Bangalore','neha.sharma@example.com',0,'Female','Neha Sharma',89.2,'Biology-Chemistry-Math','Karnataka','High School Science',2),
(47,22,'Chennai','pranav.kumar@example.com',1.5,'Male','Pranav Kumar',83.5,'Computer Science','Tamil Nadu','B.Tech CS',3),
(48,24,'Mumbai','swarna.iyer@example.com',2,'Female','Swarna Iyer',91,'Data Science','Maharashtra','M.Tech Data Science',4),
(49,21,'Pune','adithya.singh@example.com',1,'Male','Adithya Singh',78.5,'Mechanical Engineering','Maharashtra','B.Tech Mechanical',3),
(50,26,'Kochi','meera.nair@example.com',3,'Female','Meera Nair',88.7,'Business Administration','Kerala','MBA',4);

-- SKILL TABLE

INSERT INTO skills (skill_name, image_url) VALUES
('Java', 'https://source.unsplash.com/featured/?java,code'),
('Python', 'https://source.unsplash.com/featured/?python,programming'),
('C++', 'https://source.unsplash.com/featured/?c++,code'),
('Data Structures', 'https://source.unsplash.com/featured/?data,structures'),
('Algorithms', 'https://source.unsplash.com/featured/?algorithms,code'),
('SQL', 'https://source.unsplash.com/featured/?sql,database'),
('NoSQL', 'https://source.unsplash.com/featured/?nosql,database'),
('Machine Learning', 'https://source.unsplash.com/featured/?machine,learning'),
('Data Science', 'https://source.unsplash.com/featured/?data,science'),
('Deep Learning', 'https://source.unsplash.com/featured/?deep,learning'),
('Statistics', 'https://source.unsplash.com/featured/?statistics,math'),
('Cloud Computing', 'https://source.unsplash.com/featured/?cloud,computing'),
('AWS', 'https://source.unsplash.com/featured/?aws,cloud'),
('Azure', 'https://source.unsplash.com/featured/?azure,cloud'),
('Docker', 'https://source.unsplash.com/featured/?docker,containers'),
('Kubernetes', 'https://source.unsplash.com/featured/?kubernetes,containers'),
('React', 'https://source.unsplash.com/featured/?reactjs,frontend'),
('Angular', 'https://source.unsplash.com/featured/?angular,frontend'),
('Node.js', 'https://source.unsplash.com/featured/?nodejs,backend'),
('HTML/CSS', 'https://source.unsplash.com/featured/?html,css,web'),
('Flutter', 'https://source.unsplash.com/featured/?flutter,app'),
('Android Development', 'https://source.unsplash.com/featured/?android,development'),
('iOS Development', 'https://source.unsplash.com/featured/?ios,development'),
('UI/UX Design', 'https://source.unsplash.com/featured/?ui,ux,design'),
('Graphic Design', 'https://source.unsplash.com/featured/?graphic,design'),
('Embedded Systems', 'https://source.unsplash.com/featured/?embedded,systems'),
('VLSI', 'https://source.unsplash.com/featured/?vlsi,electronics'),
('Robotics', 'https://source.unsplash.com/featured/?robotics,engineering'),
('Control Systems', 'https://source.unsplash.com/featured/?control,systems'),
('Electrical Design', 'https://source.unsplash.com/featured/?electrical,design'),
('Mechanical CAD', 'https://source.unsplash.com/featured/?cad,mechanical'),
('Civil Drafting', 'https://source.unsplash.com/featured/?civil,engineering'),
('Clinical Research', 'https://source.unsplash.com/featured/?clinical,research'),
('Laboratory Techniques', 'https://source.unsplash.com/featured/?lab,techniques'),
('Pharmaceutical R&D', 'https://source.unsplash.com/featured/?pharma,research'),
('Agronomy', 'https://source.unsplash.com/featured/?agriculture,farming'),
('Food Technology', 'https://source.unsplash.com/featured/?food,technology'),
('Marketing', 'https://source.unsplash.com/featured/?marketing,business'),
('Digital Marketing', 'https://source.unsplash.com/featured/?digital,marketing'),
('Sales', 'https://source.unsplash.com/featured/?sales,business'),
('Finance', 'https://source.unsplash.com/featured/?finance,accounting'),
('Business Analytics', 'https://source.unsplash.com/featured/?business,analytics'),
('Project Management', 'https://source.unsplash.com/featured/?project,management'),
('Leadership', 'https://source.unsplash.com/featured/?leadership,team'),
('Communication', 'https://source.unsplash.com/featured/?communication,public,speaking'),
('Problem Solving', 'https://source.unsplash.com/featured/?problem,solving'),
('Research', 'https://source.unsplash.com/featured/?research,study'),
('Teaching', 'https://source.unsplash.com/featured/?teaching,education'),
('Legal Knowledge', 'https://example.com/skill49.png'),
('Time Management', 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Time_management_icon.svg');

-- INTERNSHIP_REQUIREMENTS TABLE

INSERT INTO internship_requirements(id, age, description, gender, max_experience, min_experience, mode, percentage, specialization, stream, internship_id, minimum_qualification_rank) VALUES
(1,18,'Basic understanding of C and microcontrollers; willing to work in lab.','Any',2,0,'Onsite',65,'Embedded Systems','Electronics',1,3),
(2,20,'Proficient in HTML, CSS, JS; knowledge of React preferred.','Any',3,0,'Onsite',70,'Frontend Development','Computer Science',2,3),
(3,19,'Familiarity with production lines and QC basics preferred.','Any',4,0,'Onsite',60,'Quality Assurance','Mechanical',3,2),
(4,21,'Laboratory handling skills, data entry accuracy and documentation.','Any',3,0,'Onsite',65,'Clinical Research','Pharmacy/Biotech',4,3),
(5,22,'Comfortable with Excel and financial modeling basics.','Any',5,0,'Onsite',65,'Finance','Commerce/Finance',5,3),
(6,23,'Strong visual design sense and Figma/Sketch experience.','Any',3,0,'Remote/Onsite',70,'UI/UX','Design',6,3),
(7,20,'Basic inventory knowledge and barcode systems.','Any',4,0,'Onsite',60,'Logistics','Commerce',7,2),
(8,21,'Food safety basics and sensory analysis interest.','Any',2,0,'Onsite',60,'Food Technology','Food Science',8,3),
(9,22,'Willingness to travel to rural areas and manage events.','Any',2,0,'Field',60,'CSR','Social Work',9,3),
(10,18,'Good communication and cash handling awareness.','Any',1,0,'Onsite',55,'Retail Operations','Commerce',10,1),
(11,22,'Node.js/Express and relational DB familiarity required.','Any',3,0,'Onsite',65,'Backend Development','Computer Science',11,3),
(12,21,'SEO basics and content calendar experience preferred.','Any',2,0,'Remote/Onsite',65,'Digital Marketing','Marketing',12,3),
(13,20,'Community health interest; ability to maintain accurate records.','Any',2,0,'Field',60,'Public Health','Public Health/Nursing',13,3),
(14,22,'Basic agronomy or farm systems knowledge useful.','Any',3,0,'Field',60,'Agronomy','Agriculture',14,3),
(15,21,'Understanding of plant operations and safety protocols.','Any',5,1,'Onsite',60,'Manufacturing','Mechanical/Production',15,3),
(16,22,'Molecular biology lab experience preferred; sterile technique.','Any',4,0,'Onsite',70,'Pharma R&D','Biotechnology/Pharmacy',16,3),
(17,23,'Experience in data labeling and Python ML libraries helpful.','Any',3,0,'Onsite/Remote',70,'Machine Learning','Computer Science',17,3),
(18,20,'Friendly communicator and problem solver for customer escalations.','Any',2,0,'Remote/Onsite',55,'Customer Support','Any',18,2),
(19,21,'Experience with packaging design or sustainability research.','Any',3,0,'Onsite',65,'Packaging Design','Design',19,3),
(20,19,'Comfortable with field surveys and sales outreach.','Any',2,0,'Field',55,'Sales','Commerce',20,2),
(21,22,'Interest in renewable energy with basic electrical knowledge.','Any',3,0,'Onsite',60,'Renewable Energy','Electrical/Mechanical',21,3),
(22,21,'Coordination skills and familiarity with last-mile logistics.','Any',3,0,'Onsite',55,'Logistics','Any',22,2),
(23,23,'Clinical data handling and familiarity with spreadsheets.','Any',3,0,'Onsite',65,'Clinical Data','Life Sciences',23,3),
(24,22,'PM mindset and ability to own small product features.','Any',3,0,'Onsite',65,'Product Management','Any',24,3),
(25,20,'Knowledge of automotive testing methods a plus.','Any',2,0,'Onsite',60,'Automotive Testing','Automobile Engineering',25,3),
(26,21,'Familiarity with seller onboarding processes and KYC basics.','Any',2,0,'Onsite',60,'E-commerce Operations','Any',26,2),
(27,22,'Clinical exposure and patient privacy training required.','Any',3,0,'Onsite',65,'Clinical','Nursing/MBBS',27,3),
(28,22,'Sensor prototyping experience and basic coding valued.','Any',2,0,'Onsite',65,'Agritech','Electronics/Agriculture',28,3),
(29,23,'Materials testing fundamentals and lab safety required.','Any',3,0,'Onsite',65,'Materials Science','Metallurgy/Materials',29,3),
(30,24,'Legal basics and good drafting skills; research exposure.','Any',2,0,'Onsite',65,'Legal','Law',30,3),
(31,21,'Strong Excel and SQL basics for dashboarding.','Any',3,0,'Onsite/Remote',65,'Business Analytics','Any',31,3),
(32,22,'Field coordination and community mobilization skills.','Any',3,0,'Field',60,'Rural Development','Social Work/Development',32,3),
(33,22,'Flutter or mobile development fundamentals required.','Any',3,0,'Onsite/Remote',65,'Mobile Development','Computer Science',33,3),
(34,21,'Merchandising sense and SKU tracking knowledge.','Any',2,0,'Onsite',55,'Merchandising','Commerce',34,2),
(35,23,'Chemical process understanding and lab safety awareness.','Any',3,0,'Onsite',65,'Process Engineering','Chemical Engineering',35,3),
(36,21,'Clinical lab basics and sample handling required.','Any',2,0,'Onsite',65,'Quality Control','Pharmacy/Science',36,3),
(37,20,'Content creation and multimedia skills preferred.','Any',2,0,'Remote/Onsite',60,'Content Creation','Media/Communication',37,2),
(38,22,'Strong statistics and R/Python skills for survey analysis.','Any',3,0,'Onsite',70,'Economics Research','Economics/Statistics',38,3),
(39,21,'Fabrication or welding basics useful; safety compliance required.','Any',3,0,'Onsite',60,'Welding Engineering','Mechanical',39,3),
(40,20,'Clinical diagnostics knowledge and lab etiquette needed.','Any',2,0,'Onsite',60,'Diagnostics','Life Sciences',40,2),
(41,22,'Interviewing and qualitative research experience valuable.','Any',2,0,'Field',65,'Field Research','Sociology/Anthropology',41,3),
(42,21,'Physical prototyping skills and CAD experience preferred.','Any',2,0,'Onsite',65,'Industrial Design','Design',42,3),
(43,23,'Credit risk modeling basics and Excel competency required.','Any',3,1,'Onsite',65,'Risk Analytics','Finance/Statistics',43,3),
(44,22,'Polymer lab handling and testing knowledge desired.','Any',3,0,'Onsite',65,'Polymer Chemistry','Chemistry/Material Science',44,3),
(45,21,'Campus coordination and communication skills.','Any',2,0,'Onsite',60,'HR Operations','Any',45,2),
(46,22,'Soil testing basics and field sampling training.','Any',2,0,'Field',60,'Soil Science','Agriculture',46,3),
(47,23,'Supplier contracting and negotiation basics helpful.','Any',3,0,'Onsite',65,'Procurement','Commerce',47,3),
(48,22,'Pharmacovigilance interest and basic regulatory knowledge.','Any',3,0,'Onsite',65,'Pharmacovigilance','Pharmacy/Pharmacology',48,3),
(49,21,'Instructional design mindset and LMS familiarity.','Any',2,0,'Remote',65,'Instructional Design','Education/E-learning',49,3),
(50,22,'Wind farm operations basics and safety compliance required.','Any',3,0,'Onsite',60,'Wind Energy','Mechanical/Electrical',50,3),
(51,21,'Usability research and test moderation skills preferred.','Any',2,0,'Onsite',65,'User Research','Design/Psychology',51,3),
(52,20,'Mobile testing methodology and device familiarity.','Any',2,0,'Onsite',60,'Mobile QA','IT',52,2),
(53,22,'Sustainable packaging research experience desirable.','Any',3,0,'Onsite',65,'Sustainable Packaging','Design/Material Science',53,3),
(54,21,'Farmer engagement experience and community outreach skills.','Any',2,0,'Field',60,'Extension','Agriculture/Social Work',54,2),
(55,22,'Predictive maintenance basics and sensor data understanding.','Any',3,0,'Onsite',65,'Maintenance Engineering','Mechanical',55,3),
(56,22,'Cell culture lab experience and safety procedures required.','Any',3,0,'Onsite',70,'Molecular Biology','Biotech/Biology',56,3),
(57,23,'Vendor coordination and procurement analytics preferred.','Any',3,0,'Remote/Onsite',65,'Supply Chain','Commerce',57,3),
(58,22,'Pharma QC techniques and documentation experience desired.','Any',3,0,'Onsite',70,'Quality Control','Pharmacy/Chemistry',58,3),
(59,21,'Storytelling and short-form content experience helpful.','Any',1,0,'Remote/Onsite',60,'Content Creation','Media',59,2),
(60,24,'Strong microeconomics and survey analysis ability useful.','Any',2,0,'Onsite',65,'Economics Research','Economics',60,4),
(61,22,'Welding and materials understanding required for shop floor support.','Any',3,0,'Onsite',60,'Welding','Mechanical',61,3),
(62,21,'Diagnostics QA procedures and lab hygiene critical.','Any',2,0,'Onsite',60,'Diagnostics','Life Sciences',62,2),
(63,23,'Qualitative research skills and note-taking proficiency required.','Any',2,0,'Field',65,'Field Research','Social Sciences',63,3),
(64,22,'3D CAD and prototyping experience expected.','Any',3,0,'Onsite',65,'Industrial Design','Design/Mechanical',64,3),
(65,24,'NLP familiarity and Python modeling experience preferred.','Any',2,0,'Onsite/Remote',70,'NLP','Computer Science',65,3),
(66,22,'SLA monitoring experience and vendor handling skills.','Any',3,0,'Onsite',60,'Operations','Any',66,2),
(67,21,'Selenium or automated testing basics useful.','Any',2,0,'Onsite',65,'QA Automation','Computer Science',67,3),
(68,24,'Financial modeling basics and investor pitch familiarity.','Any',2,0,'Onsite',65,'IR Research','Finance',68,3),
(69,23,'Sustainability assessments and familiarity with GHG calculators helpful.','Any',2,0,'Onsite',65,'Sustainability','Environmental Science',69,3),
(70,22,'Fixture design and mechanical drawing skills useful.','Any',3,0,'Onsite',65,'Mechanical Design','Mechanical',70,3),
(71,23,'Clinical trial knowledge and consent procedure familiarity.','Any',2,0,'Onsite',70,'Clinical Trials','Life Sciences',71,3),
(72,24,'Public policy research experience and report writing.','Any',2,0,'Onsite',65,'Public Policy','Political Science',72,4),
(73,22,'Embedded and cloud connectivity experience helpful for IoT.','Any',3,0,'Onsite',65,'IoT','Electronics/CS',73,3),
(74,21,'Creative thinking and campaign ideation experience preferred.','Any',2,0,'Onsite',60,'Brand Management','Marketing',74,3),
(75,22,'ETL basics and SQL proficiency required for BI tasks.','Any',3,0,'Onsite',70,'BI','Computer Science/IT',75,3),
(76,20,'Customer handling and store-level UX observation capability.','Any',2,0,'Onsite',55,'Customer Experience','Commerce',76,2),
(77,23,'Power systems fundamentals and SCADA exposure desired.','Any',4,0,'Onsite',65,'Power Systems','Electrical',77,3),
(78,22,'GIS knowledge and mapping skills helpful for urban planning.','Any',3,0,'Onsite',65,'Urban Planning','Civil/Planning',78,3),
(79,21,'Hospitality rotation flexibility and guest-facing skills needed.','Any',2,0,'Onsite',55,'F&B','Hospitality',79,2),
(80,22,'Data pipeline and Spark/SQL experience valuable.','Any',3,0,'Onsite',70,'Data Engineering','Computer Science',80,3),
(81,23,'Maintenance and instrumentation understanding required.','Any',3,0,'Onsite',65,'Maintenance Engineering','Mechanical',81,3),
(82,22,'PCR, aseptic technique and lab documentation experience required.','Any',3,0,'Onsite',70,'Molecular Biology','Biotech',82,3),
(83,21,'Supplier analytics and inventory reconciliation skills beneficial.','Any',2,0,'Onsite',65,'Supply Chain','Commerce',83,3),
(84,23,'Stability study knowledge and documentation best practices.','Any',3,0,'Onsite',70,'Quality Control','Pharmacy',84,3),
(85,20,'Short-form video shoot/edit experience preferred.','Any',1,0,'Remote/Onsite',55,'Content Creation','Media',85,2),
(86,24,'Survey sampling and econometric analysis skills preferred.','Any',2,0,'Onsite',70,'Economics Research','Economics/Statistics',86,4),
(87,22,'Fabrication permits and safety experience required for welding shop.','Any',3,0,'Onsite',60,'Welding','Mechanical',87,3),
(88,21,'Diagnostics test SOP understanding and QC processes required.','Any',2,0,'Onsite',60,'Diagnostics','Life Sciences',88,2),
(89,23,'Interview scheduling and transcription skills useful.','Any',2,0,'Field',65,'Field Research','Social Sciences',89,3),
(90,22,'CAD and 3D printing skills desirable.','Any',3,0,'Onsite',65,'Industrial Design','Design',90,3),
(91,23,'NLP libraries and preprocessing experience needed.','Any',3,0,'Onsite/Remote',70,'NLP','CS',91,3),
(92,21,'SLA and reporting basics for operations support.','Any',2,0,'Onsite',55,'Operations','Any',92,2),
(93,22,'Test automation and scripting ability preferred.','Any',2,0,'Onsite',65,'QA Automation','CS/IT',93,3),
(94,24,'Financial research and presentation skills required.','Any',2,0,'Onsite',65,'IR Research','Finance',94,3),
(95,23,'GHG accounting basics and sustainability reporting interest.','Any',2,0,'Onsite',65,'Sustainability','Environmental Science',95,3),
(96,22,'3D CAD/ Solidworks and prototyping familiarity expected.','Any',3,0,'Onsite',65,'Mechanical Design','Mechanical',96,3),
(97,23,'Clinical trial coordination basics and GCP exposure helpful.','Any',2,0,'Onsite',70,'Clinical Trials','Life Sciences',97,3),
(98,24,'Policy analysis and qualitative coding experience valuable.','Any',2,0,'Remote/Onsite',65,'Public Policy','Social Sciences',98,4),
(99,22,'Connectivity stacks and embedded C familiarity desirable.','Any',3,0,'Onsite',65,'IoT','Electronics/CS',99,3),
(100,21,'Design thinking and rapid prototyping skills required.','Any',2,0,'Onsite',65,'Brand Management','Marketing/Design',100,3);

-- INTERNSHIP_SKILL TABLE

INSERT INTO internship_skill (internship_id, skill_id) VALUES
(1,26),(1,15),(1,4),
(2,17),(2,6),(2,20),
(3,39),(3,31),
(4,31),(4,32),
(5,42),(5,6),
(6,24),(6,23),
(7,41),
(8,34),(8,32),
(9,41),(9,37),
(10,37),(10,48),
(11,19),(11,6),
(12,38),(12,44),
(13,49),(13,43),
(14,33),(14,40),
(15,35),(15,36),
(16,9),(16,32),(16,11),
(17,8),(17,9),
(18,43),(18,48),
(19,24),(19,25),
(20,45),(20,37),
(21,50),(21,28),
(23,31),(23,11),
(24,25),(24,39),
(25,39),(25,29),
(26,37),(26,17),
(27,32),(27,31),
(28,28),(28,1),
(29,29),(29,11),
(30,49),(30,40),
(31,41),(31,37),
(32,41),(32,44),
(33,22),(33,6),
(34,44),
(35,31),
(36,37),
(37,12),(37,17),
(38,11),(38,9),
(39,29),
(40,31),
(41,49),
(42,25),
(43,9),
(44,25),(44,33),
(45,48),(45,37),
(46,46),(46,33),
(47,47),(47,37),
(48,48),(48,32),
(49,49),
(50,50),(50,28),
(51,49),(51,23),
(52,20),
(53,25),(53,44),
(54,33),(54,37),
(55,39),
(56,32),(56,9),
(57,37),
(58,31),
(59,37),
(60,38),(60,11),
(61,29),
(62,31),
(63,49),
(64,25),
(65,8),
(66,41),
(67,6),
(68,42),
(69,40),
(70,39),
(71,32),
(72,49),
(73,1),
(75,6),
(76,41),
(77,11),
(78,31),
(79,37),
(80,9),
(81,39),
(82,32),
(83,37),
(84,31),
(86,11),
(87,29),
(89,49),
(90,25),
(91,8),
(92,41),
(93,6),
(94,42),
(97,32),
(98,49);

-- USER_SKILL TABLE

INSERT INTO user_skill (skill_id, user_id) VALUES
-- Avinash (user 1) - High School Science
(4,1),(5,1),(21,1),

-- Neha (2) - High School Biology
(31,2),(32,2),(43,2),

-- Pranav (3) - B.Tech CS
(2,3),(6,3),(17,3),(5,3),

-- Swarna (4) - M.Tech Data Science
(8,4),(9,4),(11,4),(40,4),

-- Adithya (5) - Mechanical Engg
(29,5),(30,5),(39,5),

-- Meera (6) - MBA
(37,6),(41,6),(44,6),

-- Ravi (7) - Electrical Engg
(28,7),(30,7),(39,7),

-- Isha (8) - LLM
(49,8),(43,8),(40,8),

-- Karthik (9) - Civil Engg
(31,9),(32,9),(29,9),

-- Ananya (10) - B.Tech CS
(2,10),(17,10),(6,10),

-- Sachin (11) - BSc Agriculture
(33,11),(34,11),(40,11),

-- Kavya (12) - Commerce High School
(14,12),(37,12),(41,12),

-- Pooja (13) - MBA HR
(41,13),(43,13),(46,13),

-- Aman (14) - B.Com Finance
(42,14),(37,14),(44,14),

-- Deepika (15) - PhD Biotechnology
(32,15),(9,15),(35,15),

-- Suresh (16) - B.Pharm
(32,16),(35,16),(31,16),

-- Latha (17) - M.Des
(24,17),(25,17),(23,17),

-- Tarun (18) - B.Tech Electronics
(28,18),(15,18),(16,18),

-- Ishita (19) - MA Journalism
(49,19),(43,19),(40,19),

-- Rahul J (20) - Chemical Engg
(5,20),(31,20),(39,20),

-- Neelam (21) - M.Sc Psychology
(49,21),(43,21),(47,21),

-- Manish (22) - 10th grade
(21,22),(49,22),(48,22),

-- Shruti (23) - BCA
(20,23),(6,23),(17,23),

-- Vikram (24) - Mining Engg
(29,24),(30,24),(39,24),

-- Pallavi (25) - MBA Pharma
(35,25),(32,25),(44,25),

-- Rahul S (26) - MSc Environmental
(31,26),(33,26),(40,26),

-- Sakshi (27) - BSc Marine Biology
(31,27),(33,27),(34,27),

-- Aditya P (28) - Textile Engg
(29,28),(30,28),(37,28),

-- Ritu (29) - MA Public Policy
(49,29),(40,29),(44,29),

-- Vikas (30) - Automobile Engg
(29,30),(30,30),(39,30),

-- Anjali (31) - PhD Economics
(11,31),(40,31),(49,31),

-- Sanjay (32) - MBA Ops
(41,32),(44,32),(40,32),

-- Reena (33) - B.Ed
(49,33),(50,33),(23,33),

-- Chirag (34) - B.Tech Civil
(31,34),(29,34),(39,34),

-- Shraddha (35) - B.Sc IT
(20,35),(6,35),(17,35),

-- Aman K (36) - MBA Marketing
(38,36),(41,36),(44,36),

-- Divya (37) - BHM Hospitality
(36,37),(37,37),(44,37),

-- Kumar S (38) - IT & Networking
(6,38),(15,38),(12,38),

-- Mansi (39) - High School Commerce
(41,39),(37,39),(49,39),

-- Rahul B (40) - B.Sc Biotechnology
(9,40),(32,40),(35,40),

-- Nazima (41) - MA Sociology
(49,41),(40,41),(43,41),

-- Yash (42) - B.Sc Statistics
(11,42),(40,42),(5,42),

-- Pooja S (43) - M.Sc Clinical Research
(31,43),(32,43),(34,43),

-- Tarini (44) - 10th grade
(21,44),(50,44),(49,44);
