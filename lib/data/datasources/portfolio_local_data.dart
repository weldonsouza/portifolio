import 'package:portifolio/domain/models/experience_model.dart';
import 'package:portifolio/domain/models/featured_project_model.dart';
import 'package:portifolio/domain/models/highlight_model.dart';
import 'package:portifolio/domain/models/nav_item_model.dart';
import 'package:portifolio/domain/models/project_model.dart';

/// Fonte de dados local do portfolio.
class PortfolioLocalData {
  static const List<NavItemModel> navItems = [
    NavItemModel(label: 'Sobre', sectionId: 'sobre'),
    NavItemModel(label: 'Projetos', sectionId: 'projetos'),
    NavItemModel(label: 'Experiencia', sectionId: 'experiencia'),
    NavItemModel(label: 'Contato', sectionId: 'contato'),
  ];

  static const List<HighlightModel> highlights = [
    HighlightModel(number: '10+', label: 'Anos de experiencia'),
    HighlightModel(number: '30+', label: 'Apps publicados'),
    HighlightModel(number: '15+', label: 'Empresas atendidas'),
    HighlightModel(number: '2018', label: 'Early Adopter Flutter'),
  ];

  static const List<String> techs = [
    'Flutter', 'Dart', 'Clean Architecture', 'Modularização', 'White Label',
    'Offline-First', 'MobX', 'Provider', 'REST APIs', 'NestJs', 'Firebase', 'Git', 'PlatformChannel (Integração Nativa)', 'NFC / GPS',
  ];

  static const List<String> certifications = [
    'Arquitetura de Software: Introdução aos Padrões de Projeto',
    'Arquitetura de Software: Desenvolvimento de Sistemas Sustentáveis',
    'Arquitetura de Software: Design de Sistemas e Análise de Projetos',
    'Gestão Ágil no Trabalho: Histórias de Usuários',
  ];

  static const List<FeaturedProjectModel> featuredProjects = [
    FeaturedProjectModel(
      title: 'Venidera',
      description: 'Desenvolvimento de sistemas críticos com motores de mapas híbridos e arquitetura Offline-First. Foco em telemetria em tempo real e processamento de grandes volumes de dados geográficos para operações de campo.',
      tags: ['Flutter', 'Clean Architecture', 'Mapas', 'Offline-First', 'Telemetria'],
      imageAsset: 'assets/images/prox.png',
    ),
    FeaturedProjectModel(
      title: 'Banco Modal',
      description: 'Evolução de plataforma bancária e de investimentos de alta complexidade. Aplicação rigorosa de Clean Architecture e gestão de estados complexos com MobX, garantindo segurança e escalabilidade em operações financeiras.',
      tags: ['Flutter', 'MobX', 'GetIt', 'Clean Architecture', 'Fintech'],
      imageAsset: 'assets/images/banco_modal.png',
    ),
    FeaturedProjectModel(
      title: 'Veriqs',
      description: 'Arquitetura e desenvolvimento de uma solução completa para inspeções. Integração nativa com tecnologia NFC e GPS, focada em rastreabilidade e automação de processos operacionais.',
      tags: ['Flutter', 'NFC', 'GPS', 'Visão 360º', 'Inspeção'],
      imageAsset: 'assets/images/veriqs.png',
    ),
  ];

  static const List<ProjectModel> otherProjects = [
    ProjectModel(
      title: 'Kunlatek - Full Stack',
      description: 'Ciclo completo End-to-End: APIs com NestJs e Loopback no Back-end e interfaces mobile de alta performance em Flutter no Front-end.',
      tags: ['Flutter', 'NestJs', 'Loopback', 'REST APIs', 'Full Stack'],
      type: 'Corporativo',
    ),
    ProjectModel(
      title: 'SGBov',
      description: 'Sistema de gestao pecuaria que resolve dores reais do mercado, com gerenciamento completo de rebanho e dados de campo.',
      tags: ['Flutter', 'Gestao', 'Offline-First'],
      type: 'Projeto Pessoal',
    ),
    ProjectModel(
      title: 'Jogueiros FC',
      description: 'Plataforma de gestao de comunidades esportivas. Refatoracao com Clean Architecture, sistemas de estatisticas e modulos de criacao de midia.',
      tags: ['Flutter', 'Clean Architecture', 'Esportes'],
      type: 'Recente',
    ),
    ProjectModel(
      title: 'Zuvia',
      description: 'Arquitetura White Label e integração Add-to-App: modulos Flutter embarcados em apps nativos, bases de codigo flexiveis para personalizacao total.',
      tags: ['Flutter', 'White Label', 'Add-to-App', 'PlatformChannel'],
      type: 'Corporativo',
    ),
    ProjectModel(
      title: 'Eleven Financial',
      description: 'Solucoes de analise financeira para investidores. Arquiteturas modulares e White Label com nucleo tecnologico compartilhado.',
      tags: ['Flutter', 'White Label', 'Fintech'],
      type: 'Corporativo',
    ),
    ProjectModel(
      title: 'Meu Spa',
      description: 'Desenvolvimento de ponta a ponta de quatro apps para o setor de estetica e bem-estar, com Clean Architecture e Provider.',
      tags: ['Flutter', 'Provider', 'Dio', 'REST'],
      type: 'Corporativo',
    ),
  ];

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      period: 'Ago 2023 - Presente',
      role: 'Flutter Developer',
      company: 'Venidera',
      description: 'Lideranca na modernizacao de sistemas legados com Clean Architecture. Motores de mapas hibridos (Online/Offline), arquitetura Offline-First e algoritmos de telemetria e navegacao em tempo real. Gerenciamento do pipeline de publicacao na Apple Store e Google Play.',
      tags: ['Flutter', 'Clean Architecture', 'Mapas', 'Offline-First'],
    ),
    ExperienceModel(
      period: 'Mai 2021 - Presente',
      role: 'Full Stack Developer',
      company: 'Kunlatek',
      description: 'Ciclo completo End-to-End. APIs robustas com NestJs e Loopback, interfaces mobile de alta performance com Flutter. Definicao da estrutura arquitetural e stack tecnologica.',
      tags: ['Flutter', 'NestJs', 'Loopback', 'Full Stack'],
    ),
    ExperienceModel(
      period: 'Ago 2024 - Jan 2025',
      role: 'Flutter Developer',
      company: 'Jogueiros FC',
      description: 'Modernizacao e escalabilidade da plataforma de comunidades esportivas. Refatoracao com Clean Architecture, atualizacao de dependencias e resolucao de debitos tecnicos.',
      tags: ['Flutter', 'Clean Architecture', 'Esportes'],
    ),
    ExperienceModel(
      period: 'Jan 2023 - Nov 2023',
      role: 'Flutter Developer',
      company: 'Zuvia',
      description: 'Projetos White Label com bases de codigo flexiveis para personalizacao total. Integracao de modulos Flutter em apps nativos existentes (Add-to-App).',
      tags: ['Flutter', 'White Label', 'Modularizacao'],
    ),
    ExperienceModel(
      period: 'Mar 2022 - Jan 2023',
      role: 'Mobile Developer',
      company: 'Banco Modal',
      description: 'Plataforma de alta complexidade para investimentos e servicos bancarios. Clean Architecture com MobX e GetIt para operacoes financeiras criticas.',
      tags: ['Flutter', 'MobX', 'GetIt', 'Fintech'],
    ),
    ExperienceModel(
      period: 'Mar 2022 - Jul 2022',
      role: 'Flutter Developer',
      company: 'Eleven Financial Research',
      description: 'Solucoes de analise financeira para investidores. Arquiteturas modulares e White Label com nucleo tecnologico compartilhado.',
      tags: ['Flutter', 'White Label', 'Fintech'],
    ),
    ExperienceModel(
      period: 'Dez 2021 - Abr 2022',
      role: 'Flutter Developer',
      company: 'Poman',
      description: 'Desenvolvimento integral de dois aplicativos mobile para estetica e bem-estar. Clean Architecture com Provider e Dio para consumo de servicos REST.',
      tags: ['Flutter', 'Provider', 'Dio'],
    ),
    ExperienceModel(
      period: 'Jun 2021 - Dez 2021',
      role: 'Flutter Developer',
      company: 'Meu Spa',
      description: 'Dois apps do zero para estetica e bem-estar com Clean Architecture, Provider e serializacao automatica de dados.',
      tags: ['Flutter', 'Provider', 'Clean Architecture'],
    ),
    ExperienceModel(
      period: 'Jun 2019 - Jun 2021',
      role: 'Mobile Developer',
      company: 'Carajas Home Center',
      description: 'Lideranca tecnica na estrategia mobile de um dos maiores home centers da regiao. Responsavel por todo o ciclo de vida do software, da definicao de requisitos a publicacao.',
      tags: ['Mobile', 'Android', 'Planejamento', 'CI/CD'],
    ),
  ];

  static const String githubUrl = 'https://github.com/weldonsouza';
  static const String linkedinUrl = 'https://www.linkedin.com/in/weldonsouza';
  static const String email = 'mailto:weldonrafael@hotmail.com';
}
