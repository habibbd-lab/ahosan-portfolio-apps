import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/certificate_model.dart';
import '../models/service_model.dart';
import '../models/experience_model.dart';
import '../models/testimonial_model.dart';

class PortfolioDataProvider {
  // Bio Info
  static const String name = "Md: Ahosan Habib Hasan";
  static const String title = "Flutter Mobile & Full-Stack Web Developer";
  static const String agencyStatus = "⚡ Sparktech Agency • Flutter Developer (6 Months)";
  static const String location = "Sirajgonj / Dhaka, Bangladesh";
  static const String email = "mdhasanhabibh@gmail.com";
  static const String phone = "01742757448";
  static const String whatsapp = "+880 1742-757448";
  static const String messenger = "m.me/habibhasan";
  static const String github = "https://github.com/hasan1h2";
  static const String linkedin = "https://linkedin.com/in/habibhasan";
  static const String facebook = "https://facebook.com/habibhasan";
  static const String website = "https://hasan1h2.github.io/portfolio";

  static const String bioSummary =
      "Agency-proven Flutter App Developer with 6 months hands-on experience at Sparktech Agency (Betopa Group). Specialized in building responsive cross-platform mobile apps (Dart, Flutter, GetX, REST API), web applications, clean UI architecture, graphic design, video editing, and DevOps.";

  // Projects Data
  static final List<ProjectModel> projects = [
    ProjectModel(
      id: "chef-starz",
      title: "Chef Starz Mobile App",
      category: "Flutter",
      description: "On-demand gourmet chef booking and food ordering mobile application built at Sparktech Agency.",
      fullDetails:
          "Features real-time chef booking, interactive menu customization, Stripe payment integration, REST API backend sync, GetX state bindings, and production-grade responsive UI architecture.",
      tags: ["Flutter", "Dart", "GetX", "REST API", "Stripe API"],
      status: "LIVE",
      isFeatured: true,
      isFlutterApp: true,
      githubUrl: "https://github.com/hasan1h2/chef-starz",
      liveDemoUrl: "https://hasan1h2.github.io/portfolio/projects/chef-starz",
      apkDownloadUrl: "https://hasan1h2.github.io/portfolio/assets/apk/chef-starz.apk",
    ),
    ProjectModel(
      id: "worker-hiring",
      title: "Worker Hiring (Live Project)",
      category: "Flutter",
      description: "On-demand labor booking & job dispatching mobile platform engineered with GetX state management.",
      fullDetails:
          "Connects clients directly with skilled service providers. Includes real-time booking status, job category filters, worker profiles, ratings, and push notifications.",
      tags: ["Flutter", "GetX", "REST API"],
      status: "LIVE",
      isFeatured: true,
      isFlutterApp: true,
      githubUrl: "https://github.com/hasan1h2/worker-hiring",
      apkDownloadUrl: "https://hasan1h2.github.io/portfolio/assets/apk/worker-hiring.apk",
    ),
    ProjectModel(
      id: "artisan",
      title: "Artisan (Live Project)",
      category: "Flutter",
      description: "Business management mobile application with clean architecture, client scheduling, and responsive UI.",
      fullDetails:
          "Designed for small businesses and artisans to manage service bookings, client inquiries, financial ledgers, and appointment calendars.",
      tags: ["Flutter UI", "Dart", "REST API"],
      status: "LIVE",
      isFeatured: true,
      isFlutterApp: true,
      githubUrl: "https://github.com/hasan1h2/artisan-app",
      apkDownloadUrl: "https://hasan1h2.github.io/portfolio/assets/apk/artisan.apk",
    ),
    ProjectModel(
      id: "flutter-static-ui",
      title: "Flutter Static UI Kit",
      category: "Flutter",
      description: "Collection of high-performance mobile UI layouts and custom widget components.",
      fullDetails:
          "A modular UI framework containing 40+ reusable mobile screens, dark glassmorphism themes, custom painter widgets, and smooth micro-animations.",
      tags: ["Flutter", "GetX", "Custom Painter"],
      status: "READY",
      isFlutterApp: true,
    ),
    ProjectModel(
      id: "ecommerce-mobile",
      title: "E-Commerce Mobile App",
      category: "Flutter",
      description: "Product catalog & checkout mobile client UI with cart management.",
      fullDetails:
          "Complete e-commerce store mobile app UI with product search, category filtering, wishlists, shopping cart badge, and checkout flow.",
      tags: ["Flutter", "Dart", "JSON"],
      status: "LIVE APK",
      isFlutterApp: true,
    ),
    ProjectModel(
      id: "health-tech-tracker",
      title: "Health Tech Tracker",
      category: "Flutter",
      description: "Personal fitness metrics and doctor appointment booking platform.",
      fullDetails:
          "Health tracking dashboard featuring interactive charts, heart rate monitors, step counters, appointment scheduling, and telemedicine UI.",
      tags: ["Flutter", "GetX", "Charts"],
      status: "LIVE APK",
      isFlutterApp: true,
    ),
    ProjectModel(
      id: "food-express-delivery",
      title: "Food Express Delivery",
      category: "Flutter",
      description: "Restaurant meal ordering with cart management, order tracking, and rider location.",
      fullDetails:
          "On-demand food delivery app connecting users with local restaurants, real-time map order tracking, order history, and instant checkout.",
      tags: ["Flutter", "GetX", "REST API"],
      status: "LIVE APK",
      isFlutterApp: true,
    ),
    ProjectModel(
      id: "real-estate-finder",
      title: "Real Estate Finder",
      category: "Flutter",
      description: "Property marketplace UI with dynamic filters and map previews.",
      fullDetails:
          "Property listing app allowing users to browse apartments, filter by price and location, view 360 virtual tours, and contact agents directly.",
      tags: ["Flutter", "REST API", "Google Maps"],
      status: "LIVE APK",
      isFlutterApp: true,
    ),
    ProjectModel(
      id: "crypto-wallet-ui",
      title: "Crypto Wallet UI",
      category: "Flutter",
      description: "Digital currency dashboard UI with real-time chart components.",
      fullDetails:
          "Crypto portfolio tracker UI with live asset values, transaction history, buy/sell modals, QR scanner UI, and security settings.",
      tags: ["Flutter", "Charts", "Dart"],
      status: "READY",
      isFlutterApp: true,
    ),
    ProjectModel(
      id: "social-connect",
      title: "Social Connect App",
      category: "Flutter",
      description: "Community post sharing, comments, & like counters UI.",
      fullDetails:
          "Mobile social network UI featuring home feeds, story bars, user profile pages, comment threads, dynamic likes, and notification centers.",
      tags: ["Flutter", "REST API", "GetX"],
      status: "LIVE APK",
      isFlutterApp: true,
    ),
    ProjectModel(
      id: "realtime-messenger",
      title: "Realtime Messenger",
      category: "Flutter",
      description: "Chat list, message bubbles, and status indicators.",
      fullDetails:
          "Instant messaging mobile UI supporting 1-on-1 chats, group channels, online badges, typing indicators, audio messages, and attachment drawers.",
      tags: ["Flutter", "GetX", "WebSockets"],
      status: "LIVE APK",
      isFlutterApp: true,
    ),
    ProjectModel(
      id: "task-manager-app",
      title: "Task & Productivity",
      category: "Flutter",
      description: "Task list, deadline badges, and priority tags application UI.",
      fullDetails:
          "Kanban style task management app with category colors, priority flags, progress bars, calendar view, and daily reminder notifications.",
      tags: ["Flutter", "Dart", "GetX"],
      status: "READY",
      isFlutterApp: true,
    ),
    ProjectModel(
      id: "3d-portfolio",
      title: "3D Personal Portfolio",
      category: "Web",
      description: "Award-winning dark glassmorphism website with 3D interactive hero canvas.",
      fullDetails:
          "Modern responsive portfolio engineered with HTML5, CSS3, JavaScript ES6, and Three.js for interactive background canvas rendering.",
      tags: ["Three.js", "Bootstrap 5", "Vanilla CSS"],
      status: "LIVE",
    ),
    ProjectModel(
      id: "saas-landing",
      title: "SaaS Landing Page",
      category: "Web",
      description: "Optimized landing page layout engineered for high conversion rates.",
      fullDetails:
          "SaaS product landing page featuring hero lead capture, feature showcase grids, pricing tables, client logos, and contact modal forms.",
      tags: ["HTML5", "Bootstrap 5", "JS ES6"],
      status: "LIVE",
    ),
    ProjectModel(
      id: "brand-identity",
      title: "Brand Logo & Identity",
      category: "Graphic Design",
      description: "Modern vector logo suite with typography and color system specifications.",
      fullDetails:
          "Complete brand identity package including primary vector logo, icon mark, typography scale, brand style guide, business cards, and social headers.",
      tags: ["Photoshop", "Illustrator", "Branding"],
      status: "COMPLETED",
    ),
    ProjectModel(
      id: "generative-ai-matrix",
      title: "Generative AI Matrix",
      category: "AI",
      description: "AI visual creation, prompt structuring, and creative concept prototyping.",
      fullDetails:
          "Workflow automation suite leveraging ChatGPT-4o, Claude 3.5, Midjourney, and Stable Diffusion for automated content generation.",
      tags: ["Midjourney v6", "Runway", "ChatGPT-4o"],
      status: "ACTIVE",
    ),
    ProjectModel(
      id: "tech-review-video",
      title: "Tech Review Video Edit",
      category: "Video Editing",
      description: "High-energy video pacing, dynamic lower-thirds, and visual effects.",
      fullDetails:
          "Commercial video production for YouTube Shorts, Reels, and technical tech reviews using Premiere Pro, After Effects, and CapCut motion graphics.",
      tags: ["Premiere Pro", "After Effects", "CapCut"],
      status: "PUBLISHED",
    ),
    ProjectModel(
      id: "technical-seo-growth",
      title: "Technical SEO & Growth",
      category: "Digital Marketing",
      description: "Comprehensive keyword indexing, conversion funnel optimization, and analytics.",
      fullDetails:
          "On-page meta tags, schema markup, technical sitemap auditing, Facebook Ads campaign management, and Google Analytics 4 tracking.",
      tags: ["SEO Audit", "Facebook Ads", "Analytics"],
      status: "VERIFIED",
    ),
    ProjectModel(
      id: "docker-cicd-pipeline",
      title: "Docker & CI/CD Pipeline",
      category: "DevOps",
      description: "Containerized web application deployment setup with automated test workflows.",
      fullDetails:
          "Dockerized NGINX reverse proxy configuration, automated GitHub Actions CI/CD pipelines, SSL certificate renewal, and server deployment.",
      tags: ["Docker", "GitHub Actions", "NGINX"],
      status: "ACTIVE LAB",
    ),
  ];

  // Skills Data
  static final List<SkillModel> skills = [
    SkillModel(
      id: "flutter",
      name: "Flutter",
      category: "Mobile Dev",
      percentage: 95,
      level: "PROFESSIONAL",
      description: "Cross-Platform UI Engine",
      details: "Mastery of Flutter SDK, custom widgets, state bindings, animations, and responsive cross-platform compilation.",
      isTopFeatured: true,
    ),
    SkillModel(
      id: "dart",
      name: "Dart",
      category: "Mobile Dev",
      percentage: 90,
      level: "PROFESSIONAL",
      description: "Object-Oriented Language",
      details: "Advanced Dart 3 language features, OOP principles, async/await, isolates, extension methods, and type safety.",
    ),
    SkillModel(
      id: "getx",
      name: "GetX",
      category: "Mobile Dev",
      percentage: 92,
      level: "ADVANCED",
      description: "Reactive State & Routing",
      details: "State management, dependency injection, GetView, GetController, GetX named routing, and snackbar/dialog bindings.",
    ),
    SkillModel(
      id: "html5",
      name: "HTML5",
      category: "Web Dev",
      percentage: 95,
      level: "PROFESSIONAL",
      description: "Semantic & Accessible Markup",
      details: "Clean HTML5 semantic structure, ARIA accessibility attributes, W3C standards, and SEO optimization.",
      isTopFeatured: true,
    ),
    SkillModel(
      id: "css3",
      name: "CSS3",
      category: "Web Dev",
      percentage: 92,
      level: "PROFESSIONAL",
      description: "Vanilla Styling & Glass UI",
      details: "Flexbox, CSS Grid, keyframe animations, glassmorphism UI, CSS variables, and media queries.",
      isTopFeatured: true,
    ),
    SkillModel(
      id: "bootstrap5",
      name: "Bootstrap 5",
      category: "Web Dev",
      percentage: 92,
      level: "PROFESSIONAL",
      description: "Custom Responsive UI Grid",
      details: "Responsive grid systems, custom utility classes, component styling, and theme overrides.",
    ),
    SkillModel(
      id: "javascript",
      name: "JavaScript (ES6)",
      category: "Web Dev",
      percentage: 88,
      level: "ADVANCED",
      description: "Dynamic Logic & jQuery",
      details: "DOM manipulation, ES6 syntax, Promises, Fetch API, async/await, event loops, and interactive UI logic.",
    ),
    SkillModel(
      id: "git-github",
      name: "Git & GitHub",
      category: "Version Control",
      percentage: 90,
      level: "ADVANCED",
      description: "Branch Management",
      details: "Version control workflows, Git CLI, pull request architecture, merge conflict resolution, and GitHub Actions.",
    ),
    SkillModel(
      id: "rest-api",
      name: "REST API & JSON",
      category: "Mobile Dev",
      percentage: 88,
      level: "ADVANCED",
      description: "Backend Data & Networking",
      details: "Asynchronous HTTP requests, JSON parsing, error handling, token authentication, and data repository pattern.",
    ),
    SkillModel(
      id: "firebase",
      name: "Firebase (Basic)",
      category: "Mobile Dev",
      percentage: 80,
      level: "INTERMEDIATE",
      description: "BaaS Auth & Cloud Firestore",
      details: "Firebase Auth, Firestore database integration, Cloud Storage, and push notifications setup.",
    ),
    SkillModel(
      id: "photoshop-illustrator",
      name: "Photoshop & Illustrator",
      category: "Graphic Design",
      percentage: 88,
      level: "ADVANCED",
      description: "Graphic Design & Branding",
      details: "Vector logo creation, social media branding kits, poster design, photo editing, and UI assets export.",
    ),
    SkillModel(
      id: "seo-marketing",
      name: "SEO & Digital Marketing",
      category: "Marketing",
      percentage: 85,
      level: "ADVANCED",
      description: "Digital Marketing Strategy",
      details: "Technical SEO audits, keyword research, Meta Ads manager, Google Search Console, and Google Analytics 4.",
    ),
    SkillModel(
      id: "ai-prompting",
      name: "AI Prompting & Automation",
      category: "AI Tools",
      percentage: 88,
      level: "ADVANCED",
      description: "ChatGPT • Gemini • Claude",
      details: "Prompt engineering, AI image generation, automated content workflows, and developer productivity tools.",
    ),
  ];

  // Certificates Data
  static final List<CertificateModel> certificates = [
    CertificateModel(
      id: "bdc-flt-2024",
      title: "Flutter App Development",
      institute: "BdCalling Academy, Dhaka",
      date: "June 2024",
      credentialId: "BDC-FLT-2024-8891",
      category: "Professional Certificates",
      description:
          "Professional training certification covering Dart language, GetX state management, REST API binding, JSON parsing, clean architecture, and Play Store publishing workflows.",
      skills: ["Flutter", "Dart", "GetX", "REST API"],
    ),
    CertificateModel(
      id: "dit-web-2023",
      title: "Web Development Professional",
      institute: "Dreamland IT Institute",
      date: "Dec 2023",
      credentialId: "DIT-WEB-2023-4512",
      category: "Professional Certificates",
      description:
          "Comprehensive full-stack web development program covering HTML5, CSS3, Bootstrap 5, JavaScript ES6+, DOM manipulation, responsive layouts, and hosting.",
      skills: ["HTML5", "CSS3", "Bootstrap 5", "JavaScript"],
    ),
    CertificateModel(
      id: "cit-des-2022",
      title: "Graphic Design & Brand Media",
      institute: "Creative IT Institute",
      date: "Aug 2022",
      credentialId: "CIT-DES-2022-3109",
      category: "Professional Certificates",
      description:
          "Professional graphics course covering vector logo creation, branding guidelines, poster design, business cards, print design, Photoshop, and Illustrator.",
      skills: ["Photoshop", "Illustrator", "Branding"],
    ),
    CertificateModel(
      id: "do-lab-2025",
      title: "DevOps & Cloud Infrastructure",
      institute: "Self-Paced Cloud Pathway",
      date: "2025 (Ongoing)",
      credentialId: "DO-LAB-2025-001",
      category: "Training",
      description:
          "Hands-on learning pathway covering Linux server administration, Docker containerization, NGINX reverse proxies, and GitHub Actions CI/CD pipelines.",
      skills: ["Linux", "Docker", "CI/CD", "NGINX"],
    ),
    CertificateModel(
      id: "gmh-seo-2023",
      title: "SEO & Growth Marketing",
      institute: "Growth Marketing Hub",
      date: "Mar 2023",
      credentialId: "GMH-SEO-2023-7720",
      category: "Training",
      description:
          "Practical training covering on-page SEO, keyword positioning, Meta Ads Facebook marketing, Google Analytics 4, and conversion auditing.",
      skills: ["SEO", "Meta Ads", "GA4"],
    ),

    // Planned Future Certifications
    CertificateModel(
      id: "aws-cloud",
      title: "AWS Cloud Practitioner",
      institute: "Amazon Web Services",
      date: "Planned",
      credentialId: "PLANNED",
      category: "Future Certifications",
      description: "AWS cloud fundamentals, core services, security, architecture, and pricing models certification.",
      skills: ["AWS", "Cloud"],
      isVerified: false,
      isFuturePlanned: true,
    ),
    CertificateModel(
      id: "docker-certified",
      title: "Docker Certified Associate",
      institute: "Docker Inc.",
      date: "Planned",
      credentialId: "PLANNED",
      category: "Future Certifications",
      description: "Container orchestration, Dockerfile optimization, multi-container compose, and registry management.",
      skills: ["Docker", "Containers"],
      isVerified: false,
      isFuturePlanned: true,
    ),
    CertificateModel(
      id: "kubernetes-cka",
      title: "Kubernetes CKA",
      institute: "Linux Foundation / CNCF",
      date: "Planned",
      credentialId: "PLANNED",
      category: "Future Certifications",
      description: "Certified Kubernetes Administrator managing cluster setup, storage, networking, and security.",
      skills: ["Kubernetes", "K8s"],
      isVerified: false,
      isFuturePlanned: true,
    ),
    CertificateModel(
      id: "github-actions-spec",
      title: "GitHub Actions Specialist",
      institute: "GitHub",
      date: "Planned",
      credentialId: "PLANNED",
      category: "Future Certifications",
      description: "Advanced CI/CD workflow automation, runner configuration, security scanning, and release automation.",
      skills: ["CI/CD", "GitHub Actions"],
      isVerified: false,
      isFuturePlanned: true,
    ),
    CertificateModel(
      id: "linux-lpic1",
      title: "Linux Administration (LPIC-1)",
      institute: "Linux Professional Institute",
      date: "Planned",
      credentialId: "PLANNED",
      category: "Future Certifications",
      description: "Linux system architecture, bash CLI command line tools, file permissions, and system administration.",
      skills: ["Linux", "Bash"],
      isVerified: false,
      isFuturePlanned: true,
    ),
    CertificateModel(
      id: "google-flutter-adv",
      title: "Google Flutter Advanced",
      institute: "Google / Flutter Team",
      date: "Planned",
      credentialId: "PLANNED",
      category: "Future Certifications",
      description: "Advanced architecture, custom platform channels, performance optimization, and memory profiling.",
      skills: ["Flutter", "Dart"],
      isVerified: false,
      isFuturePlanned: true,
    ),
    CertificateModel(
      id: "azure-az900",
      title: "Azure Fundamentals (AZ-900)",
      institute: "Microsoft",
      date: "Planned",
      credentialId: "PLANNED",
      category: "Future Certifications",
      description: "Microsoft Azure cloud services, security, governance, compliance, and infrastructure management.",
      skills: ["Azure", "Cloud"],
      isVerified: false,
      isFuturePlanned: true,
    ),
    CertificateModel(
      id: "openai-api-dev",
      title: "OpenAI API Developer",
      institute: "OpenAI",
      date: "Planned",
      credentialId: "PLANNED",
      category: "Future Certifications",
      description: "Generative AI LLM integration, function calling, vector embeddings, and fine-tuning workflows.",
      skills: ["AI", "OpenAI"],
      isVerified: false,
      isFuturePlanned: true,
    ),
  ];

  // Services Data
  static final List<ServiceModel> services = [
    ServiceModel(
      id: "flutter-dev",
      title: "Flutter App Development",
      description: "Cross-platform iOS and Android mobile applications engineered with GetX state management, clean architecture, and smooth REST API integration.",
      estimatedTimeline: "2 - 4 Weeks",
      keyFeatures: [
        "Single codebase for iOS & Android",
        "GetX & Provider State Management",
        "RESTful API & JSON Data Sync",
        "Native 60fps animations & widgets",
        "SQLite Local Caching & Offline Support",
      ],
      developmentProcess: [
        "1. UI Wireframing",
        "2. Architecture Setup",
        "3. API Binding",
        "4. QA Testing",
        "5. App Store Publishing",
      ],
      technologiesUsed: ["Flutter", "Dart", "GetX", "REST API", "Firebase", "SQLite"],
      deliverables: ["Full Source Code", "APK & IPA Releases", "Documentation", "30 Days Maintenance"],
      faqs: [
        {"q": "How do we start a new project?", "a": "We begin with a detailed requirements discussion to define project scope, wireframes, and technical architecture."},
        {"q": "Is source code ownership provided?", "a": "Yes, complete source code ownership is transferred upon project finalization."},
      ],
    ),
    ServiceModel(
      id: "web-dev",
      title: "Website Development",
      description: "High-performance full-stack web applications and websites crafted with HTML5, Vanilla CSS3, Bootstrap 5, JavaScript ES6+, and jQuery.",
      estimatedTimeline: "1 - 3 Weeks",
      keyFeatures: [
        "100% Mobile & Tablet Responsive",
        "SEO-friendly semantic structure",
        "Fast loading speed & lightweight CSS",
        "Custom dark theme & glassmorphism",
        "Cross-browser compatibility",
      ],
      developmentProcess: [
        "1. Briefing & Specs",
        "2. Design Mockups",
        "3. Frontend Coding",
        "4. Optimization",
        "5. Launch",
      ],
      technologiesUsed: ["HTML5", "CSS3", "JavaScript ES6", "Bootstrap 5", "jQuery", "GSAP"],
      deliverables: ["Production HTML/CSS/JS Files", "GitHub Pages Ready Repo", "Asset Files"],
      faqs: [
        {"q": "Will the website work on mobile devices?", "a": "Yes, every layout is built 100% responsive for mobile, tablet, laptop, and desktop screens."},
      ],
    ),
    ServiceModel(
      id: "ui-ux-design",
      title: "UI/UX Design",
      description: "User-centered interface design, interactive prototypes, visual aesthetics, wireframing, and seamless user experience flows.",
      estimatedTimeline: "1 - 2 Weeks",
      keyFeatures: [
        "User research & persona mapping",
        "High-fidelity mobile & web wireframes",
        "Design systems & UI component kits",
        "Interactive clickable prototypes",
      ],
      developmentProcess: [
        "1. Discovery",
        "2. Wireframes",
        "3. UI Mockups",
        "4. Interactive Prototype",
      ],
      technologiesUsed: ["Figma", "Photoshop", "Illustrator", "Custom UI Kits"],
      deliverables: ["Figma Design Files", "Exported UI Assets", "Clickable Prototype"],
      faqs: [
        {"q": "Do you provide reusable UI kits?", "a": "Yes, a complete design system with reusable component guides is delivered."},
      ],
    ),
    ServiceModel(
      id: "graphic-design",
      title: "Graphic Design",
      description: "Creative visual graphics, logo design, brand identity packages, promotional posters, banners, flyers, and business cards.",
      estimatedTimeline: "3 - 7 Days",
      keyFeatures: [
        "Vector logo & brand identity kit",
        "Social media post & banner design",
        "Print-ready brochures & flyers",
        "High CTR YouTube thumbnails",
      ],
      developmentProcess: ["1. Brand Brief", "2. Vector Sketches", "3. Color Selection", "4. Export Formats"],
      technologiesUsed: ["Photoshop", "Illustrator", "Vector Suite"],
      deliverables: ["Vector AI/EPS Files", "PNG/JPG Formats", "Brand Style Guide"],
      faqs: [
        {"q": "Are vector source files included?", "a": "Yes, vector source files (AI, EPS, SVG) are provided."},
      ],
    ),
    ServiceModel(
      id: "video-editing",
      title: "Video Editing",
      description: "Engaging video editing for YouTube tech reviews, viral Instagram reels, TikTok shorts, commercial app promos, and motion intros.",
      estimatedTimeline: "2 - 5 Days",
      keyFeatures: [
        "High retention pacing & jump cuts",
        "Animated pop-up captions & subtitles",
        "Sound FX & background music sync",
        "4K & 1080p high quality render",
      ],
      developmentProcess: ["1. Raw Footage Sync", "2. Cuts & Pacing", "3. Text & FX", "4. Color & Audio Grading"],
      technologiesUsed: ["Premiere Pro", "After Effects", "CapCut"],
      deliverables: ["Rendered 4K MP4 Video", "Project Files"],
      faqs: [
        {"q": "What formats do you output?", "a": "Vertical 9:16 Shorts/Reels and Horizontal 16:9 4K videos."},
      ],
    ),
    ServiceModel(
      id: "seo-optimization",
      title: "SEO Optimization",
      description: "Technical SEO audits, on-page search engine optimization, keyword strategy, schema markup, and speed enhancements for organic growth.",
      estimatedTimeline: "1 - 2 Weeks",
      keyFeatures: [
        "Technical SEO audit & sitemap submission",
        "On-page meta title & description tuning",
        "High-intent keyword positioning",
        "Google Search Console & GA4 setup",
      ],
      developmentProcess: ["1. Audit", "2. Keyword Plan", "3. On-Page Fixes", "4. Analytics Verification"],
      technologiesUsed: ["Google Search Console", "GA4", "SEO Audit Suite"],
      deliverables: ["Audit Report", "Optimized Meta Tags", "GA4 Dashboard Setup"],
      faqs: [
        {"q": "How long until results show?", "a": "Technical fixes reflect within 2 to 4 weeks after Google re-indexing."},
      ],
    ),
    ServiceModel(
      id: "digital-marketing",
      title: "Digital Marketing",
      description: "Strategic Facebook Ads, Meta campaigns, Google Search Ads, sales funnel setup, target audience retargeting, and lead generation.",
      estimatedTimeline: "Ongoing",
      keyFeatures: [
        "Meta Ads (Facebook & Instagram)",
        "Google Search PPC Ad campaigns",
        "High conversion ad copy & creatives",
        "Pixel & Conversion API tracking",
      ],
      developmentProcess: ["1. Target Audience Mapping", "2. Ad Creative Build", "3. Campaign Launch", "4. A/B Testing"],
      technologiesUsed: ["Meta Business Manager", "Google Ads", "Conversion API"],
      deliverables: ["Ad Campaigns Setup", "Weekly Analytics Reports"],
      faqs: [
        {"q": "Do you handle ad budgets?", "a": "Ad budgets are managed via your company's official Meta/Google Billing accounts."},
      ],
    ),
    ServiceModel(
      id: "ai-content-creation",
      title: "AI Content Creation",
      description: "Leveraging AI generators, prompt engineering matrices, Midjourney concept art, AI avatar videos, and automated content workflows.",
      estimatedTimeline: "2 - 5 Days",
      keyFeatures: [
        "Midjourney v6 photorealistic art",
        "Synthetic avatar speech video clips",
        "ChatGPT-4o & Claude 3.5 prompt templates",
        "Automated social content pipelines",
      ],
      developmentProcess: ["1. Prompt Matrix", "2. Image/Text Generation", "3. Quality Polishing"],
      technologiesUsed: ["ChatGPT-4o", "Midjourney", "Runway", "Claude 3.5"],
      deliverables: ["AI Media Library", "Custom Prompt Templates"],
      faqs: [
        {"q": "Can AI visuals be used commercially?", "a": "Yes, all generated assets carry commercial usage licenses."},
      ],
    ),
    ServiceModel(
      id: "website-maintenance",
      title: "Website Maintenance",
      description: "Continuous website updates, speed optimization, bug fixing, security monitoring, SSL renewal, and content updates to keep sites smooth.",
      estimatedTimeline: "Monthly Retainer",
      keyFeatures: [
        "Regular bug fixing & layout patches",
        "Performance & page speed maintenance",
        "Security monitoring & SSL updates",
        "Content refresh & asset updates",
      ],
      developmentProcess: ["1. Daily Health Checks", "2. Weekly Backup", "3. Monthly Updates"],
      technologiesUsed: ["Git", "Docker", "SSL Engine", "Server Monitor"],
      deliverables: ["Monthly Maintenance Log", "Guaranteed 99.9% Uptime"],
      faqs: [
        {"q": "What is the response time for urgent bugs?", "a": "Under 2 hours for critical fixes."},
      ],
    ),
  ];

  // Experiences Data
  static final List<ExperienceModel> experiences = [
    ExperienceModel(
      id: "sparktech-agency",
      title: "Flutter App Developer",
      company: "Sparktech Agency, Betopa Group",
      duration: "6 Months",
      dateRange: "2024",
      category: "Professional Work",
      tenureBadge: "AGENCY TENURE • 6 MONTHS",
      description:
          "Served as a core Flutter mobile developer at Sparktech Agency (Betopa Group). Collaborated directly with team members, UI designers, and API backend developers to build natively compiled Flutter mobile applications for real-world commercial release.",
      responsibilities: [
        "Developed responsive and user-friendly Flutter mobile applications (Chef Starz, Worker Hiring, Artisan).",
        "Designed and implemented clean, reusable, and maintainable UI components.",
        "Integrated REST APIs and handled JSON data for real-time application functionality.",
        "Used GetX for reactive state management and seamless navigation.",
        "Fixed bugs, optimized app performance, and improved user experience.",
        "Collaborated with team members using Git/GitHub and participated in testing, debugging, and deployment of Flutter applications.",
      ],
      tags: ["Flutter SDK", "Dart 3", "GetX State", "REST APIs", "Git / GitHub", "Material UI"],
    ),
    ExperienceModel(
      id: "freelance-developer",
      title: "Freelance Software & Creative Developer",
      company: "Fiverr • Upwork • International & Local Clients",
      duration: "Present",
      dateRange: "2023 - Present",
      category: "Professional Work",
      tenureBadge: "INDEPENDENT CONSULTING",
      description:
          "Delivering end-to-end digital solutions combining technical software development with high-impact visual design. Trusted by international entrepreneurs, software agencies, and local businesses to craft premium web applications, mobile UIs, and brand identities.",
      responsibilities: [
        "Developed custom responsive web architectures using HTML5, CSS3, Bootstrap 5, and JavaScript (ES6/jQuery).",
        "Designed high-conversion brand identities, vector logos, social media kits, and marketing banners using Photoshop & Illustrator.",
        "Produced engaging promotional video commercials, YouTube Shorts, and Instagram Reels using CapCut and motion typography.",
        "Provided technical consultation, UI bug debugging, and Search Engine Optimization (SEO) structure formatting.",
      ],
      tags: ["HTML5 / CSS3", "Bootstrap 5", "ES6 & jQuery", "Photoshop & Illustrator", "CapCut Editing"],
    ),
    ExperienceModel(
      id: "bdcalling-academy",
      title: "Practical Software Development Workshop",
      company: "BdCalling Academy, Dhaka",
      duration: "3 Months",
      dateRange: "2024",
      category: "Education & Training",
      tenureBadge: "INDUSTRIAL TRAINING",
      description:
          "Completed intensive practical training in industry-standard software development methodologies, modern version control workflows, and collaborative project building under senior tech mentorship.",
      responsibilities: [
        "Hands-on training in object-oriented programming principles and structured code architecture.",
        "Mastered Git CLI, branch conflict resolutions, and collaborative team development on GitHub.",
        "Built practical portfolio projects emphasizing responsive UI design and cross-device compatibility.",
      ],
      tags: ["Software Principles", "Git Workflows", "Responsive UI"],
    ),
    ExperienceModel(
      id: "dreamland-it",
      title: "Graphic Design & Video Editing Certification",
      company: "Dreamland IT Institute",
      duration: "3 Months",
      dateRange: "2023",
      category: "Education & Training",
      tenureBadge: "DIPLOMA CERTIFICATION",
      description:
          "Earned professional certification in digital graphic arts, brand design psychology, and multimedia video production. Developed a sharp aesthetic eye that elevates all software engineering interfaces.",
      responsibilities: [
        "Advanced mastery of Adobe Photoshop & Adobe Illustrator for vector illustration and raster manipulations.",
        "Color theory, typography pairing, grid layout composition, and visual branding guidelines.",
        "Commercial video editing, sound syncing, motion keyframing, and visual effects using CapCut.",
      ],
      tags: ["Adobe Photoshop", "Adobe Illustrator", "Video Production", "UI Aesthetics"],
    ),
  ];

  // Testimonials Data
  static final List<TestimonialModel> testimonials = [
    TestimonialModel(
      id: "testi-1",
      quote:
          "Ahosan Habib Hasan built our Flutter app UI with exceptional speed and clean code structure. His API integration and GetX binding implementation made our app perform flawlessly.",
      authorName: "Sparktech Project Lead",
      authorTitle: "Project Supervisor",
      authorCompany: "Sparktech Agency",
      initials: "ST",
    ),
    TestimonialModel(
      id: "testi-2",
      quote:
          "Outstanding graphic design and web development skill. Ahosan Habib Hasan designed our brand assets and landing page with high conversion aesthetics and responsive performance.",
      authorName: "Rahman Ahmed",
      authorTitle: "Digital Agency Founder",
      authorCompany: "Digital Agency",
      initials: "RA",
    ),
    TestimonialModel(
      id: "testi-3",
      quote:
          "Ahosan Habib Hasan is a quick learner with immense commitment. His progress in Flutter, full-stack web, and DevOps pipelines is inspiring. Highly recommended candidate!",
      authorName: "Senior Mentor",
      authorTitle: "Academic Instructor",
      authorCompany: "BdCalling Academy",
      initials: "BD",
    ),
  ];

  // FAQs Data
  static final List<Map<String, String>> faqs = [
    {
      "question": "Are you available for freelance and full-time positions?",
      "answer": "Yes, I am actively available for remote full-time software engineering roles, contract consulting, and freelance project work."
    },
    {
      "question": "What is your experience with Flutter Mobile App Development?",
      "answer": "I have 6 months of agency-proven experience at Sparktech Agency building production Flutter mobile apps with GetX state management, REST API integration, and clean MVC architecture."
    },
    {
      "question": "Do you build full-stack responsive web applications?",
      "answer": "Yes, I build modern web applications using HTML5, CSS3, JavaScript ES6+, Bootstrap 5, and Flutter Web, ensuring 100% responsive display across mobile, tablet, and desktop."
    },
    {
      "question": "Do you provide vector source files for Graphic Design work?",
      "answer": "Yes, all graphic design deliverables include original vector source files (AI, EPS, SVG) along with high-resolution PNG/JPG exports."
    },
    {
      "question": "How long does Technical SEO optimization take to show results?",
      "answer": "Technical SEO fixes and meta updates typically begin showing improved search engine rankings and Google indexation within 2 to 4 weeks."
    },
    {
      "question": "How do you handle international clients and milestone payments?",
      "answer": "I work with international clients via transparent contract agreements and milestone payments through Fiverr, Upwork, Wire Transfer, or Payoneer."
    },
  ];
}
