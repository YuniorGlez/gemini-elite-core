import { useTranslation } from 'react-i18next';
import { motion, type Variants } from 'framer-motion';
import type { TFunction } from 'i18next';
import { 
  Globe, 
  Github, 
  Terminal, 
  Cpu, 
  Zap, 
  Layers,
  Copy,
  Check
} from 'lucide-react';

const languages = [
  { code: 'en', name: 'English' },
  { code: 'es', name: 'Español' },
  { code: 'pt', name: 'Português' },
  { code: 'zh', name: '中文' },
  { code: 'de', name: 'Deutsch' },
];

function App() {
  const { t, i18n } = useTranslation();

  const changeLanguage = (lng: string) => {
    i18n.changeLanguage(lng);
  };

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: { 
      opacity: 1,
      transition: { staggerChildren: 0.2 }
    }
  };

  const itemVariants = {
    hidden: { y: 20, opacity: 0 },
    visible: { y: 0, opacity: 1 }
  };

  return (
    <div className="min-h-screen selection:bg-gemini-blue/30">
      {/* Navbar */}
      <nav className="fixed top-0 w-full z-50 glass-panel border-x-0 border-t-0">
        <div className="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 rounded-lg bg-gemini-gradient animate-gradient flex items-center justify-center">
              <Terminal size={18} className="text-white" />
            </div>
            <span className="font-bold text-xl tracking-tight bg-clip-text text-transparent bg-gradient-to-r from-white to-white/70">
              GEMINI ELITE CORE
            </span>
          </div>
          
          <div className="flex items-center gap-6">
            <div className="flex items-center gap-2 group relative">
              <Globe size={18} className="text-gemini-muted group-hover:text-gemini-blue transition-colors" />
              <select 
                onChange={(e) => changeLanguage(e.target.value)}
                className="bg-transparent text-sm text-gemini-muted focus:outline-none cursor-pointer hover:text-white transition-colors appearance-none pr-4"
                value={i18n.language}
              >
                {languages.map((lang) => (
                  <option key={lang.code} value={lang.code} className="bg-gemini-surface text-white">
                    {lang.name}
                  </option>
                ))}
              </select>
            </div>
            <a 
              href="https://github.com/YuniorGlez/gemini-elite-core" 
              target="_blank" 
              className="text-gemini-muted hover:text-white transition-colors"
            >
              <Github size={20} />
            </a>
          </div>
        </div>
      </nav>

      <main className="pt-32 pb-20 px-6">
        {/* Hero Section */}
        <section className="max-w-5xl mx-auto text-center mb-32">
          <motion.div
            initial={{ scale: 0.9, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            transition={{ duration: 0.5 }}
            className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-gemini-blue/10 border border-gemini-blue/20 text-gemini-blue text-sm mb-6"
          >
            <Zap size={14} />
            <span>v5.6 Optimized for Gemini v0.27 Nightly</span>
          </motion.div>
          
          <motion.h1 
            initial={{ y: 20, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            className="text-5xl md:text-7xl font-extrabold mb-8 tracking-tight"
          >
            {t('hero.title').split('Gemini').map((part, i) => (
              <span key={i}>
                {part}
                {i === 0 && <span className="bg-clip-text text-transparent bg-gemini-gradient animate-gradient">Gemini</span>}
              </span>
            ))}
          </motion.h1>
          
          <motion.p 
            initial={{ y: 20, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ delay: 0.1 }}
            className="text-xl text-gemini-muted max-w-2xl mx-auto mb-12 leading-relaxed"
          >
            {t('hero.subtitle')}
          </motion.p>
          
          <motion.div 
            initial={{ y: 20, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ delay: 0.2 }}
            className="flex flex-col sm:flex-row gap-4 justify-center"
          >
            <a 
              href="https://github.com/YuniorGlez/gemini-elite-core"
              target="_blank"
              className="px-10 py-4 bg-white text-black font-bold rounded-xl hover:bg-gemini-blue hover:text-white transition-all transform hover:scale-105 active:scale-95 flex items-center justify-center gap-2"
            >
              <Github size={20} />
              {t('hero.cta_github')}
            </a>
          </motion.div>
        </section>

        {/* Features Grid */}
        <section className="max-w-7xl mx-auto mb-32">
          <h2 className="text-3xl font-bold text-center mb-16">{t('features.title')}</h2>
          
          <motion.div 
            variants={containerVariants}
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true }}
            className="grid md:grid-cols-2 lg:grid-cols-4 gap-6"
          >
            <FeatureCard 
              icon={<Cpu className="text-gemini-blue" />}
              title={t('features.agents.title')}
              desc={t('features.agents.desc')}
              variants={itemVariants}
            />
            <FeatureCard 
              icon={<Zap className="text-gemini-purple" />}
              title={t('features.hooks.title')}
              desc={t('features.hooks.desc')}
              variants={itemVariants}
            />
            <FeatureCard 
              icon={<Layers className="text-gemini-pink" />}
              title={t('features.conductor.title')}
              desc={t('features.conductor.desc')}
              variants={itemVariants}
            />
            <FeatureCard 
              icon={<Globe className="text-gemini-blue" />}
              title={t('features.browser.title')}
              desc={t('features.browser.desc')}
              variants={itemVariants}
            />
          </motion.div>
        </section>

        <motion.div 
          variants={containerVariants}
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true }}
        >
          <InstallSection t={t} />
        </motion.div>

        {/* Community / Open Source */}
        <section className="max-w-4xl mx-auto rounded-3xl overflow-hidden relative">
          <div className="absolute inset-0 bg-gemini-gradient animate-gradient opacity-10"></div>
          <div className="glass-panel p-12 text-center relative z-10">
            <div className="w-16 h-16 rounded-2xl bg-white/5 flex items-center justify-center mx-auto mb-6">
              <Github size={32} className="text-white" />
            </div>
            <h2 className="text-4xl font-bold mb-6">{t('community.title')}</h2>
            <p className="text-lg text-gemini-muted mb-10 max-w-xl mx-auto">
              {t('community.text')}
            </p>
            <button className="px-8 py-3 rounded-full bg-white text-black font-bold hover:bg-gemini-blue hover:text-white transition-all">
              {t('community.fork')}
            </button>
          </div>
        </section>
      </main>

      <footer className="py-12 border-t border-white/5 text-center text-gemini-muted">
        <div className="max-w-7xl mx-auto px-6">
          <div className="flex items-center justify-center gap-2 mb-4">
            <Terminal size={16} />
            <span className="font-bold text-white text-sm tracking-widest uppercase">GEMINI ELITE CORE</span>
          </div>
          <p className="text-sm mb-2">
            {t('footer.community')}
          </p>
          <p className="text-xs opacity-50">
            {t('footer.made_by')}
          </p>
        </div>
      </footer>
    </div>
  );
}

interface FeatureCardProps {
  icon: React.ReactNode;
  title: string;
  desc: string;
  variants: Variants;
}

function FeatureCard({ icon, title, desc, variants }: FeatureCardProps) {
  return (
    <motion.div 
      variants={variants}
      className="glass-panel p-8 rounded-2xl hover:border-gemini-blue/50 transition-colors group"
    >
      <div className="w-12 h-12 rounded-xl bg-white/5 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
        {icon}
      </div>
      <h3 className="text-xl font-bold mb-3">{title}</h3>
      <p className="text-gemini-muted leading-relaxed">
        {desc}
      </p>
    </motion.div>
  );
}

function InstallSection({ t }: { t: TFunction }) {
  const commands = [
    { label: t('install.step1'), cmd: 'git clone https://github.com/YuniorGlez/gemini-elite-core.git' },
    { label: t('install.step2'), cmd: 'cd gemini-elite-core' },
    { label: t('install.step3'), cmd: 'chmod +x setup.sh && ./setup.sh' }
  ];

  return (
    <section className="max-w-4xl mx-auto mb-32 px-6">
      <h2 className="text-3xl font-bold text-center mb-12">{t('install.title')}</h2>
      <div className="bg-[#0b0b0d] rounded-2xl border border-white/10 overflow-hidden shadow-2xl">
        {/* Terminal Header */}
        <div className="bg-white/5 px-4 py-3 flex items-center gap-2 border-b border-white/5">
          <div className="flex gap-1.5">
            <div className="w-3 h-3 rounded-full bg-red-500/50" />
            <div className="w-3 h-3 rounded-full bg-yellow-500/50" />
            <div className="w-3 h-3 rounded-full bg-green-500/50" />
          </div>
          <div className="flex-1 text-center">
            <span className="text-xs text-gemini-muted font-mono">zsh — setup</span>
          </div>
        </div>
        
        {/* Terminal Body */}
        <div className="p-6 font-mono text-sm sm:text-base space-y-6">
          {commands.map((step, i) => (
            <div key={i} className="space-y-2">
              <div className="flex items-center gap-2 text-gemini-muted/60 text-xs uppercase tracking-widest">
                <span className="w-4 h-4 rounded bg-white/5 flex items-center justify-center text-[10px]">{i + 1}</span>
                {step.label}
              </div>
              <div className="flex items-center justify-between group bg-white/[0.02] p-3 rounded-lg border border-white/5 hover:border-gemini-blue/30 transition-colors">
                <code className="text-gemini-blue truncate mr-4">
                  <span className="text-gemini-pink mr-2">$</span>
                  {step.cmd}
                </code>
                <button 
                  onClick={() => navigator.clipboard.writeText(step.cmd)}
                  className="p-2 hover:bg-white/10 rounded-md transition-colors opacity-0 group-hover:opacity-100"
                >
                  <Copy size={14} className="text-gemini-muted" />
                </button>
              </div>
            </div>
          ))}
          <div className="pt-4 flex items-center gap-2 text-green-400 font-bold">
            <Check size={18} />
            {t('install.ready')}
          </div>
        </div>
      </div>
    </section>
  );
}

export default App;
