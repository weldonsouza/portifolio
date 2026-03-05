# Portfolio Weldon Souza - Documentacao Completa para Flutter

> Documento de especificacao de design e layout para replicacao do portfolio web em Flutter.
> Todos os valores de espacamento estao em **dp** (density-independent pixels).
> Todas as cores estao em **Hex** e **RGBA**.

---

## 1. DESIGN SYSTEM

### 1.1 Paleta de Cores

| Token               | Hex       | RGBA                     | Uso                                     |
|----------------------|-----------|--------------------------|------------------------------------------|
| `background`         | `#1A2332` | `rgba(26, 35, 50, 1)`   | Fundo principal de toda a aplicacao      |
| `foreground`         | `#E0E8F0` | `rgba(224, 232, 240, 1)` | Texto principal / titulos                |
| `card`               | `#1F2B3D` | `rgba(31, 43, 61, 1)`   | Fundo de cards e containers elevados     |
| `primary`            | `#5EEAD4` | `rgba(94, 234, 212, 1)` | Cor de destaque, acentos, links ativos   |
| `primary/10`         | `#5EEAD41A`| `rgba(94, 234, 212, 0.1)`| Fundo sutil de tags e hover states     |
| `primary/20`         | `#5EEAD433`| `rgba(94, 234, 212, 0.2)`| Barras de progresso (fundo)            |
| `primary/5`          | `#5EEAD40D`| `rgba(94, 234, 212, 0.05)`| Glow / halo sutil                    |
| `secondary`          | `#253347` | `rgba(37, 51, 71, 1)`   | Fundos secundarios                       |
| `muted-foreground`   | `#7A8BA3` | `rgba(122, 139, 163, 1)` | Texto secundario, descricoes, labels    |
| `border`             | `#2D3E54` | `rgba(45, 62, 84, 1)`   | Bordas de cards, separadores, divisores  |
| `border/50`          | `#2D3E5480`| `rgba(45, 62, 84, 0.5)` | Bordas mais sutis (footer, separadores) |

**Gradiente de texto (text-gradient):**
- `LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight)`
- De: `#5EEAD4` (primary)
- Para: `#38A3B8` (teal mais escuro)

### 1.2 Tipografia

| Familia            | Uso                                      | Google Fonts             |
|--------------------|------------------------------------------|--------------------------|
| **Inter**          | Corpo de texto, titulos, descricoes      | `google_fonts: Inter`    |
| **JetBrains Mono** | Numeros, labels tecnicas, tags, badges   | `google_fonts: JetBrains Mono` |

#### Escala Tipografica

| Elemento                  | Familia         | Tamanho  | Peso       | Altura de Linha | Tracking       |
|---------------------------|-----------------|----------|------------|-----------------|----------------|
| Hero titulo (h1)          | Inter           | 48dp (mobile) / 72dp (desktop) | Bold (700) | 1.1 (tight) | -0.02em (tight) |
| Hero subtitulo (h2)       | Inter           | 30dp / 48dp | Bold (700) | 1.1            | -0.02em        |
| Titulo de secao           | Inter           | 24dp / 30dp | Bold (700) | 1.2            | normal         |
| Titulo de projeto (card)  | Inter           | 20dp / 24dp | Bold (700) | 1.3            | normal         |
| Titulo de card (outros)   | Inter           | 16dp     | SemiBold (600) | 1.4           | normal         |
| Subtitulo experiencia     | Inter           | 16dp     | SemiBold (600) | 1.4           | normal         |
| Corpo de texto            | Inter           | 18dp     | Regular (400) | 1.6 (relaxed) | normal         |
| Corpo de texto (small)    | Inter           | 14dp     | Regular (400) | 1.6           | normal         |
| Label (mono)              | JetBrains Mono  | 14dp     | Regular (400) | 1.4           | 0.05em (wider) |
| Label (mono) pequeno      | JetBrains Mono  | 12dp     | Regular (400) | 1.4           | normal         |
| Tag de tecnologia         | JetBrains Mono  | 12dp     | Regular (400) | 1.2           | normal         |
| Tag badge (com fundo)     | JetBrains Mono  | 12dp     | Regular (400) | 1.2           | normal         |
| Numero de secao (01.)     | JetBrains Mono  | 14dp     | Regular (400) | 1.4           | normal         |
| Numero highlight card     | JetBrains Mono  | 24dp / 30dp | Bold (700) | 1.2           | normal         |
| Logo "WS"                 | JetBrains Mono  | 18dp     | Bold (700) | 1.2            | -0.02em (tight)|
| Footer texto              | JetBrains Mono  | 12dp     | Regular (400) | 1.4           | normal         |
| Status bar (mockup)       | JetBrains Mono  | 10dp     | Regular (400) | 1.2           | normal         |
| Mockup labels             | JetBrains Mono  | 9dp      | Regular (400) | 1.2           | normal         |
| Mockup numeros            | JetBrains Mono  | 11dp     | Bold (700) | 1.2            | normal         |

### 1.3 Bordas e Raios

| Elemento               | Border Radius |
|------------------------|---------------|
| Raio padrao (radius)   | 12dp          |
| Cards gerais           | 12dp          |
| Botoes                 | 6dp           |
| Tags com fundo         | 999dp (full)  |
| Phone frame exterior   | 40dp          |
| Phone notch            | 0 top, 16dp bottom |
| Phone screen interior  | 32dp          |
| Mini cards (mockup)    | 8dp           |
| Logo square (mockup)   | 12dp          |
| Dot (timeline)         | 999dp (full)  |
| Dot (tech bullet)      | 999dp (full)  |
| Barras de progresso    | 999dp (full)  |
| Imagem de projeto      | 12dp          |

### 1.4 Sombras

| Elemento               | Sombra                                                  |
|------------------------|---------------------------------------------------------|
| Phone mockup           | `BoxShadow(color: #00000040, blurRadius: 25, offset: Offset(0, 10))` |
| Card de descricao (featured project) | `BoxShadow(color: #00000030, blurRadius: 16, offset: Offset(0, 4))` |
| Header (scrolled)      | Sem sombra, usa `backdrop-blur` (BackdropFilter sigmaX: 12, sigmaY: 12) |
| Glow do phone          | Sombra difusa: `BoxShadow(color: #5EEAD40D, blurRadius: 48, spreadRadius: 32)` |

### 1.5 Animacoes

| Tipo                              | Duracao | Curva              | Delay                           |
|-----------------------------------|---------|--------------------|----------------------------------|
| Fade in + slide up (secoes)       | 700ms   | easeOut            | 0ms                              |
| Fade in cards (stagger)           | 500ms   | easeOut            | index * 100ms (max ~600ms)       |
| Fade in projetos (stagger)        | 700ms   | easeOut            | index * 150ms                    |
| Fade in hero texto                | 700ms   | easeOut            | 100ms (delay inicial)            |
| Fade in hero mockup               | 1000ms  | easeOut            | 300ms                            |
| Hover em cards                    | 300ms   | easeOut            | -                                |
| Hover translate Y                 | 500ms   | easeOut            | -                                |
| Cor de transicao (link/hover)     | 200ms   | linear             | -                                |
| Menu hamburger rotacao            | 300ms   | easeOut            | -                                |

**Trigger:** Todas as animacoes de entrada sao disparadas via `IntersectionObserver` com `threshold: 0.05 a 0.2`.
Em Flutter, use `VisibilityDetector` (pacote) ou `Sliver` com `AnimationController`.

**Transformacao padrao:** `translateY(32dp)` -> `translateY(0)` + `opacity: 0` -> `opacity: 1`

---

## 2. ESTRUTURA DE LAYOUT

### 2.1 Container Global

```
Largura maxima do conteudo: 1024dp (max-w-5xl equivale a ~1024px)
Padding horizontal: 24dp (px-6)
Centralizacao: margin auto horizontal
```

### 2.2 Responsividade (Breakpoints)

| Breakpoint        | Largura minima | Equivalente Tailwind |
|-------------------|----------------|----------------------|
| Mobile (padrao)   | 0dp            | (sem prefixo)        |
| Small (sm)        | 640dp          | `sm:`                |
| Medium (md)       | 768dp          | `md:`                |
| Large (lg)        | 1024dp         | `lg:`                |

> Em Flutter, use `MediaQuery.of(context).size.width` ou `LayoutBuilder` para decidir entre layouts mobile e desktop.

---

## 3. COMPONENTES DETALHADOS

### 3.1 Header

```
Estrutura: Fixed no topo, z-index alto
Largura: 100% da tela
Conteudo: max-width 1024dp, centralizado
Padding: horizontal 24dp, vertical 16dp

Estado normal:   fundo transparente
Estado scrolled: fundo background com 80% opacidade + backdrop blur 12dp + borda inferior 1px border

Layout: Row (space-between)
  - Esquerda: Logo "WS"
      - Familia: JetBrains Mono
      - Tamanho: 18dp
      - Peso: Bold
      - Cor: primary (#5EEAD4)
      - Tracking: tight (-0.02em)

  - Centro/Direita (desktop): Row de links
      - Gap entre links: 32dp (gap-8)
      - Cada link:
          - Prefixo: "0X." em JetBrains Mono, 12dp, cor primary
          - Texto: Inter, 14dp, Regular
          - Cor normal: muted-foreground (#7A8BA3)
          - Cor hover/ativo: primary (#5EEAD4)
          - Margem entre prefixo e texto: 4dp (mr-1)

  - Direita (mobile): Botao hamburger
      - Dimensao: 32x32dp
      - 3 barras horizontais:
          - Largura: 24dp, Altura: 2dp
          - Cor: foreground (#E0E8F0)
          - Gap entre barras: 6dp (gap-1.5)
          - Animacao aberto: barra 1 rotaciona +45deg e translada Y +8dp
                             barra 2 opacidade 0
                             barra 3 rotaciona -45deg e translada Y -8dp

Menu Mobile (aberto):
  - Fundo: background 95% opacidade + backdrop blur
  - Borda inferior: 1px border
  - Padding vertical: 32dp (py-8)
  - Links centralizados verticalmente
  - Gap entre links: 24dp (gap-6)
  - Tamanho do texto: 16dp
```

### 3.2 Hero Section

```
Estrutura: min-height 100vh, flex center vertical
Padding horizontal: 24dp

Fundo decorativo (grid):
  - Linhas: 1px brancas com 10% opacidade
  - Espacamento do grid: 60x60dp
  - Opacidade geral: 3% (0.03)
  - pointer-events: none (nao interagivel)

Layout Desktop: Grid 2 colunas [1fr, auto]
  - Gap: 48dp (gap-12)
  - Alinhamento vertical: center

Layout Mobile: Coluna unica (mockup escondido)

--- Coluna Esquerda (Texto) ---

Ordem vertical e espacamentos:
  1. Label superior
     - Texto: "Ola, meu nome e"
     - Familia: JetBrains Mono
     - Tamanho: 14dp
     - Cor: primary (#5EEAD4)
     - Tracking: 0.05em (wider)
     - Margem inferior: 20dp (mb-5)

  2. Nome (H1)
     - Texto: "Weldon Souza."
     - Familia: Inter
     - Tamanho: 48dp (mobile) / 72dp (desktop, text-7xl)
     - Peso: Bold
     - Cor: foreground (#E0E8F0)
     - Line-height: tight (1.1)
     - Tracking: tight (-0.02em)

  3. Subtitulo (H2)
     - Texto: "Eu construo apps mobile."
     - Familia: Inter
     - Tamanho: 30dp (mobile) / 48dp (desktop, text-5xl)
     - Peso: Bold
     - Cor: muted-foreground (#7A8BA3)
     - Line-height: tight (1.1)
     - Tracking: tight (-0.02em)
     - Margem superior: 8dp (mt-2)

  4. Paragrafo descritivo
     - Tamanho: 18dp (text-lg)
     - Cor: muted-foreground (#7A8BA3)
     - Line-height: 1.6 (relaxed)
     - Largura maxima: ~576dp (max-w-xl)
     - Margem superior: 24dp (mt-6)
     - Destaques inline:
       - "10 anos de experiencia": cor foreground, peso Medium (500)
       - "Flutter": cor primary, peso Medium
       - Demais: muted-foreground, Regular

  5. Icones sociais (Row)
     - Margem superior: 40dp (mt-10)
     - Gap: 24dp (gap-6)
     - Icone tamanho: 22x22dp
     - Cor normal: muted-foreground (#7A8BA3)
     - Cor hover: primary (#5EEAD4)
     - Hover: translateY(-2dp)
     - Icones: GitHub, LinkedIn, Email (envelope)

  6. Botao CTA
     - Margem superior: 40dp (mt-10)
     - Padding: horizontal 28dp, vertical 12dp (px-7 py-3)
     - Borda: 1px solid primary
     - Texto: "Vamos conversar?"
     - Familia: JetBrains Mono
     - Tamanho: 14dp
     - Cor texto: primary
     - Border radius: 6dp
     - Hover: fundo primary/10

--- Coluna Direita (Phone Mockup, apenas desktop) ---

  Glow externo:
    - Cor: primary/5 (#5EEAD40D)
    - Formato: circulo
    - Blur: 48dp
    - Inset: -32dp em todas as direcoes

  Phone Frame:
    - Largura: 224dp (w-56)
    - Altura: 460dp
    - Border radius: 40dp (rounded-[2.5rem])
    - Borda: 4dp solid border (#2D3E54)
    - Fundo: card (#1F2B3D)
    - Padding interno: 12dp (p-3)
    - Sombra: shadow-2xl

  Notch:
    - Posicao: centralizado no topo
    - Largura: 112dp (w-28)
    - Altura: 24dp (h-6)
    - Fundo: background (#1A2332)
    - Border radius: 0 top, 16dp bottom (rounded-b-2xl)

  Screen (conteudo interno):
    - Border radius: 32dp (rounded-[2rem])
    - Fundo: background (#1A2332)
    - Layout: Column, overflow hidden

    Status Bar:
      - Padding: horizontal 20dp, top 32dp, bottom 8dp
      - Layout: Row (space-between)
      - Esquerda: "9:41" JetBrains Mono, 10dp, muted-foreground
      - Direita: icone bateria
          - Container: 14x8dp, border 1px muted-foreground/50, radius 2dp
          - Barra interna: 8dp largura, altura full, cor primary, radius 2dp

    App Content (corpo):
      - Padding: horizontal 16dp, top 12dp

      - Logo mini "WS":
          - Container: 40x40dp, radius 12dp
          - Fundo: primary/15
          - Texto: JetBrains Mono, 12dp, Bold, primary
          - Margem inferior: 12dp

      - Linha placeholder 1: 96x8dp, fundo foreground/15, radius full, mb 8dp
      - Linha placeholder 2: 128x8dp, fundo foreground/10, radius full, mb 20dp

      - Grid 2 colunas (mini cards):
          - Gap: 8dp
          - Margem inferior: 16dp
          - Cada card:
              - Altura: 64dp (h-16)
              - Radius: 8dp
              - Fundo: primary/8
              - Borda: 1px primary/10
              - Layout: Column (center, center)
              - Numero: primary, JetBrains Mono, 11dp, Bold
              - Label: muted-foreground, 8dp

      - Lista de skills (Column):
          - Gap: 8dp
          - Cada item: Row
              - Dot: 6x6dp, radius full, cor primary
              - Texto: JetBrains Mono, 9dp, muted-foreground
              - Barra de progresso (flex-1):
                  - Altura: 4dp
                  - Fundo: primary/20
                  - Radius: full
                  - Preenchimento: 85%, cor primary, radius full

    Bottom Bar:
      - Padding: bottom 12dp, top 8dp
      - Indicador: 32x4dp, radius full, fundo foreground/20, centralizado
```

### 3.3 Secao Sobre (About)

```
Padding vertical: 112dp (py-28)
Padding horizontal: 24dp

--- Titulo da Secao ---
  Layout: Row
  Gap: 16dp (gap-4)
  - Numero: "01." JetBrains Mono, 14dp, primary
  - Texto: "Sobre mim", Inter, 24dp (mobile) / 30dp (desktop), Bold, foreground
  - Linha divisoria (apenas desktop): flex-1, height 1dp, cor border
  Margem inferior: 56dp (mb-14)

--- Highlight Cards ---
  Grid: 2 colunas (mobile) / 4 colunas (desktop)
  Gap: 16dp
  Margem inferior: 56dp (mb-14)

  Cada card:
    - Padding: 20dp (p-5)
    - Border radius: 12dp
    - Fundo: card (#1F2B3D)
    - Borda: 1dp solid border
    - Borda hover: primary/30
    - Alinhamento: center
    - Numero: JetBrains Mono, 24dp (mobile) / 30dp (desktop), Bold, primary
    - Label: Inter, 12dp, Regular, muted-foreground, margem superior 4dp

  Dados:
    - { "10+", "Anos de experiencia" }
    - { "20+", "Apps publicados" }
    - { "9", "Empresas atendidas" }
    - { "2018", "Early Adopter Flutter" }

--- Conteudo Principal ---
  Grid: 1 coluna (mobile) / [3fr 2fr] (desktop)
  Gap: 48dp (gap-12)

  Coluna Esquerda (Texto descritivo):
    - Layout: Column
    - Gap entre paragrafos: 16dp (gap-4)
    - Tamanho: 16dp (padrao de paragrafo, nao o 18dp do hero)
    - Cor: muted-foreground
    - Line-height: 1.6 (relaxed)
    - Destaques inline:
        - Nomes de tecnologias/cargos: cor foreground, peso Medium
        - "Flutter": cor primary, peso Medium

    Paragrafos:
    1. "Sou um Engenheiro de Software Mobile com 10 anos de experiencia..."
    2. "Sou um early adopter do framework..."
    3. "Ao longo da ultima decada..."

  Coluna Direita:
    - Label: "Tecnologias:", Inter, 14dp, Medium, foreground, margem inferior 16dp

    - Grid de tecnologias:
        - 2 colunas
        - Gap horizontal: 24dp (gap-x-6)
        - Gap vertical: 10dp (gap-y-2.5)
        - Cada item: Row
            - Icone: ">" (triangulo) JetBrains Mono, 12dp, primary
            - Gap: 10dp (gap-2.5)
            - Texto: Inter, 14dp, muted-foreground
        - Lista: Flutter, Dart, Clean Architecture, MobX, Provider,
                 REST APIs, NestJs, Firebase, Git, NFC / GPS,
                 White Label, CI/CD

    - Card de certificacoes:
        - Margem superior: 32dp (mt-8)
        - Padding: 20dp (p-5)
        - Radius: 12dp
        - Fundo: card
        - Borda: 1dp border

        - Titulo: "Certificacoes", JetBrains Mono, 12dp, muted-foreground
        - Margem superior da lista: 8dp
        - Gap entre itens: 6dp (gap-1.5)
        - Cada item: Row
            - Dot: 4x4dp, radius full, cor primary
            - Texto: Inter, 12dp, muted-foreground
        - Lista:
            - Padroes de Projeto
            - Design de Sistemas
            - Analise de Projetos
            - Sistemas Sustentaveis
            - Gestao Agil
```

### 3.4 Secao Projetos

```
Padding vertical: 112dp (py-28)
Padding horizontal: 24dp

--- Titulo da Secao ---
  (Mesmo padrao da secao Sobre, com "02." e "Projetos")
  Margem inferior: 56dp

--- Projetos em Destaque (Featured) ---
  Layout: Column
  Gap entre projetos: 80dp (gap-20)
  Margem inferior: 80dp (mb-20)

  Cada projeto: Grid 12 colunas (desktop), stack (mobile)
  Gap: 16dp (gap-4)
  Alinhamento vertical: center

  Padrao alternado (index par/impar):
    - Par (index 0, 2): imagem cols 1-7, texto cols 6-12, texto alinhado a direita
    - Impar (index 1): imagem cols 6-12, texto cols 1-7, texto alinhado a esquerda

  Imagem:
    - Aspect ratio: 16:9 (aspect-video)
    - Border radius: 12dp
    - Overflow: hidden
    - Overlay: fundo primary/20 sobre a imagem
    - Hover: overlay transparente
    - Filtro: grayscale por padrao
    - Hover: grayscale removido
    - Transicao: 500ms para filtro, 300ms para overlay

  Conteudo (sobre a imagem, z-index 20):
    - Label: "Destaque", JetBrains Mono, 12dp, primary, margem inferior 8dp
    - Titulo: Inter, 20dp (mobile) / 24dp (desktop), Bold, foreground, margem inferior 16dp
    - Card de descricao:
        - Padding: 20dp
        - Radius: 12dp
        - Fundo: card/90 (card com 90% opacidade)
        - Backdrop blur: sutil
        - Borda: 1dp border
        - Sombra: shadow-lg
        - Texto: Inter, 14dp, muted-foreground, line-height 1.6
        - Margem inferior: 16dp
    - Tags (Row, wrap):
        - Gap: 8dp
        - Alinhamento: end (se par) / start (se impar)
        - Cada tag: JetBrains Mono, 12dp, muted-foreground (sem fundo)

  Dados dos Featured:
    1. Venidera: "Sistema critico de alta disponibilidade..."
       Tags: Flutter, Clean Architecture, Mapas, Offline-First, Telemetria
       Imagem: /images/project-fintech.jpg

    2. Banco Modal: "Plataforma de alta complexidade..."
       Tags: Flutter, MobX, GetIt, Clean Architecture, Fintech
       Imagem: /images/project-fitness.jpg

    3. Kunlatek: "Ciclo completo de desenvolvimento..."
       Tags: Flutter, NestJs, Loopback, REST APIs, Full Stack
       Imagem: /images/project-delivery.jpg

--- Subtitulo "Outros projetos relevantes" ---
  Alinhamento: center
  Tamanho: 20dp, SemiBold, foreground
  Margem inferior: 40dp (mb-10)

--- Grid de Outros Projetos ---
  Grid: 1 coluna (mobile) / 2 colunas (sm) / 3 colunas (lg)
  Gap: 16dp (gap-4)

  Cada card:
    - Layout: Column (flex)
    - Padding: 24dp (p-6)
    - Radius: 12dp
    - Fundo: card
    - Borda: 1dp border
    - Borda hover: primary/30
    - Hover: translateY(-4dp)
    - Transicao: 500ms

    - Header (Row, space-between):
        - Esquerda: Icone pasta (SVG)
            - Tamanho: 36x36dp
            - Cor: primary
            - Stroke width: 1
            - Path: pasta/folder
        - Direita: Tipo badge
            - JetBrains Mono, 10dp, uppercase
            - Cor: muted-foreground/70
            - Tracking: 0.1em (wider)
        - Margem inferior: 16dp

    - Titulo: Inter, 16dp, SemiBold, foreground
        - Hover: cor primary
        - Margem inferior: 8dp

    - Descricao: Inter, 14dp, Regular, muted-foreground, line-height 1.6
        - flex: 1 (ocupa espaco restante)
        - Padding inferior: 16dp

    - Footer tags:
        - Borda superior: 1dp border/50
        - Padding superior: 12dp (pt-3)
        - Layout: Row (wrap)
        - Gap horizontal: 12dp (gap-x-3)
        - Gap vertical: 4dp (gap-y-1)
        - Cada tag: JetBrains Mono, 12dp, muted-foreground

  Dados:
    1. Veriqs - "Projeto Pessoal" - NFC/GPS
    2. SGBov - "Projeto Pessoal" - Gestao pecuaria
    3. Jogueiros FC - "Recente" - Esportes
    4. Zuvia - "Corporativo" - White Label
    5. Eleven Financial - "Corporativo" - Fintech
    6. Poman & Meu Spa - "Corporativo" - Estetica
```

### 3.5 Secao Experiencia

```
Padding vertical: 112dp (py-28)
Padding horizontal: 24dp

--- Titulo da Secao ---
  (Mesmo padrao, com "03." e "Experiencia")
  Margem inferior: 56dp

--- Timeline ---
  Layout: Relative (Stack no Flutter)

  Linha vertical:
    - Posicao: left 0 (mobile) / left 180dp (desktop)
    - Largura: 1dp
    - Cor: border (#2D3E54)
    - Altura: 100% da secao

  Itens (Column):
    - Gap: 8dp (gap-2)

  Cada item:
    - Layout desktop: Grid [180dp, 1fr]
    - Gap: 32dp (gap-8)
    - Layout mobile: padding-left 24dp

    Dot no timeline:
      - Posicao: sobre a linha vertical, alinhado ao topo do conteudo (~24dp do topo)
      - Tamanho: 10x10dp (w-2.5 h-2.5)
      - Formato: circulo (radius full)
      - Fundo normal: background (#1A2332)
      - Borda: 2dp solid primary
      - Hover: fundo primary (preenchido)
      - Transicao: 300ms
      - Offset X: centralizado na linha (-50% + 0.5dp)

    Coluna esquerda (Periodo):
      - JetBrains Mono, 12dp, muted-foreground
      - Alinhamento desktop: direita (text-right)
      - Padding superior: 20dp (pt-5)
      - Padding direita (desktop): 32dp (pr-8)
      - white-space: nowrap

    Coluna direita (Conteudo):
      - Padding: bottom 32dp, top 16dp, left 24dp (desktop: pl-8)
      - Radius: 12dp
      - Hover: fundo card/50
      - Margem esquerda: -4dp (-ml-1)

      - Titulo: Inter, 16dp, SemiBold
          - Cor: foreground
          - Hover: primary
          - Formato: "Role · Company"
          - "· Company" em cor primary

      - Descricao:
          - Margem superior: 8dp (mt-2)
          - Inter, 14dp, muted-foreground, line-height 1.6

      - Tags (Row, wrap):
          - Margem superior: 12dp (mt-3)
          - Gap: 8dp (gap-2)
          - Cada tag:
              - Padding: horizontal 10dp, vertical 2dp (px-2.5 py-0.5)
              - JetBrains Mono, 12dp
              - Cor: primary
              - Fundo: primary/10
              - Radius: full (pill)

  Dados das experiencias (em ordem):
    1. Ago 2023 - Presente | Flutter Developer | Venidera
    2. Mai 2021 - Presente | Full Stack Developer | Kunlatek
    3. Ago 2024 - Jan 2025 | Flutter Developer | Jogueiros FC
    4. Jan 2023 - Nov 2023 | Flutter Developer | Zuvia
    5. Mar 2022 - Jan 2023 | Mobile Developer | Banco Modal
    6. Mar 2022 - Jul 2022 | Flutter Developer | Eleven Financial Research
    7. Dez 2021 - Abr 2022 | Flutter Developer | Poman
    8. Jun 2021 - Dez 2021 | Flutter Developer | Meu Spa
    9. Jun 2019 - Jun 2021 | Mobile Developer | Carajas Home Center

--- Link para LinkedIn ---
  Margem superior: 56dp (mt-14)
  Alinhamento: center
  Layout: Row inline
  Gap: 8dp
  Texto: "Ver curriculo completo no LinkedIn"
  Familia: JetBrains Mono, 14dp, primary
  Hover: underline (offset 4dp)
  Icone seta: 16x16dp, stroke primary
    - Path: seta diagonal (top-right arrow)
```

### 3.6 Secao Contato

```
Padding vertical: 112dp (py-28)
Padding horizontal: 24dp

Container: max-width ~576dp (max-w-xl), centralizado
Alinhamento: center

Ordem:
  1. Label: "04. E agora?"
     - JetBrains Mono, 14dp, primary

  2. Titulo: "Vamos conversar?"
     - Margem superior: 20dp (mt-5)
     - Inter, 30dp (mobile) / 48dp (desktop), Bold, foreground
     - text-balance

  3. Paragrafo:
     - Margem superior: 24dp (mt-6)
     - Inter, 18dp, muted-foreground, line-height 1.6

  4. Botao CTA:
     - Margem superior: 40dp (mt-10)
     - Padding: horizontal 32dp, vertical 14dp (px-8 py-3.5)
     - Borda: 1dp solid primary
     - Texto: "Enviar mensagem"
     - JetBrains Mono, 14dp, primary
     - Radius: 6dp
     - Hover: fundo primary/10
     - Layout: Row (inline-flex), gap 8dp
```

### 3.7 Footer

```
Padding vertical: 40dp (py-10)
Padding horizontal: 24dp
Borda superior: 1dp border/50

Container: max-width 1024dp, centralizado
Layout: Column, center
Gap: 20dp (gap-5)

Icones sociais (Row):
  - Gap: 24dp (gap-6)
  - Tamanho: 18x18dp
  - Cor: muted-foreground
  - Hover: primary, translateY(-2dp)
  - Icones: GitHub, LinkedIn, Email

Texto:
  - "Desenvolvido por Weldon Souza"
  - JetBrains Mono, 12dp, muted-foreground, center
```

---

## 4. ICONES SVG (Paths)

Todos os icones sao inline SVG com as seguintes propriedades padrao:
- `fill: none`
- `stroke: currentColor`
- `strokeWidth: 2` (ou 1 para o icone de pasta)
- `strokeLinecap: round`
- `strokeLinejoin: round`

### 4.1 GitHub (22x22 / 18x18)
```svg
<path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"/>
ViewBox: 0 0 24 24
```

### 4.2 LinkedIn (22x22 / 18x18)
```svg
<path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"/>
<rect width="4" height="12" x="2" y="9"/>
<circle cx="4" cy="4" r="2"/>
ViewBox: 0 0 24 24
```

### 4.3 Email / Envelope (22x22 / 18x18)
```svg
<rect width="20" height="16" x="2" y="4" rx="2"/>
<path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
ViewBox: 0 0 24 24
```

### 4.4 Pasta / Folder (36x36, strokeWidth: 1)
```svg
<path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/>
ViewBox: 0 0 24 24
```

### 4.5 Seta Diagonal / External Link (16x16)
```svg
<path d="M7 7h10v10"/>
<path d="M7 17 17 7"/>
ViewBox: 0 0 24 24
```

### 4.6 Triangulo / Play (usado na lista de techs)
```
Caractere Unicode: U+25B6 (&#9654;)
Ou use um CustomPainter com triangulo de 6x6dp
Cor: primary
```

---

## 5. HIERARQUIA DE SCROLL (Ordem das Secoes)

```
1. Header  (fixed, sempre visivel)
2. Hero    (min-height: 100vh)
3. Sobre   (id: "sobre",  py: 112dp)
4. Projetos (id: "projetos", py: 112dp)
5. Experiencia (id: "experiencia", py: 112dp)
6. Contato (id: "contato", py: 112dp)
7. Footer  (py: 40dp)
```

---

## 6. INTERACOES E ESTADOS

### 6.1 Header - Active Section Detection
- Ao rolar, detectar qual secao esta visivel (topo da secao <= 150dp do topo da viewport)
- Iterar de baixo para cima e usar o primeiro match
- Destacar o link correspondente com cor `primary`

### 6.2 Cards - Hover States
| Elemento                    | Estado Normal              | Estado Hover                  |
|-----------------------------|---------------------------|-------------------------------|
| Highlight card (Sobre)      | borda: border             | borda: primary/30             |
| Other project card          | borda: border, Y: 0      | borda: primary/30, Y: -4dp   |
| Card titulo                 | cor: foreground           | cor: primary                  |
| Timeline item container     | fundo: transparente       | fundo: card/50                |
| Timeline titulo             | cor: foreground           | cor: primary                  |
| Timeline dot                | fundo: background         | fundo: primary (preenchido)   |
| Featured project image      | grayscale + overlay teal  | colorido + overlay transparente|
| Link/icone social           | cor: muted-foreground, Y:0| cor: primary, Y: -2dp         |
| Botao CTA                   | fundo: transparente       | fundo: primary/10             |

### 6.3 Scroll Behavior
- `scroll-behavior: smooth` em todo o HTML
- Em Flutter: usar `ScrollController.animateTo()` com `Curves.easeOut`

---

## 7. NOTAS PARA IMPLEMENTACAO FLUTTER

### 7.1 Pacotes Recomendados
```yaml
dependencies:
  google_fonts: ^6.0.0          # Inter e JetBrains Mono
  visibility_detector: ^0.4.0   # Para animacoes de entrada (IntersectionObserver)
  url_launcher: ^6.0.0          # Para abrir links externos
  flutter_svg: ^2.0.0           # Se quiser SVGs como assets (opcional, pode usar CustomPaint)
```

### 7.2 Mapeamento Tailwind -> Flutter

| Tailwind         | Flutter                                    | Valor       |
|------------------|--------------------------------------------|-------------|
| `px-6`           | `EdgeInsets.symmetric(horizontal: 24)`     | 24dp        |
| `py-28`          | `EdgeInsets.symmetric(vertical: 112)`      | 112dp       |
| `gap-4`          | `SizedBox(height/width: 16)` ou gap no Wrap| 16dp        |
| `gap-6`          | `SizedBox(height/width: 24)`               | 24dp        |
| `gap-8`          | `SizedBox(height/width: 32)`               | 32dp        |
| `gap-12`         | `SizedBox(height/width: 48)`               | 48dp        |
| `gap-20`         | `SizedBox(height/width: 80)`               | 80dp        |
| `mt-2`           | `SizedBox(height: 8)`                      | 8dp         |
| `mt-5`           | `SizedBox(height: 20)`                     | 20dp        |
| `mt-6`           | `SizedBox(height: 24)`                     | 24dp        |
| `mt-8`           | `SizedBox(height: 32)`                     | 32dp        |
| `mt-10`          | `SizedBox(height: 40)`                     | 40dp        |
| `mt-14`          | `SizedBox(height: 56)`                     | 56dp        |
| `mb-2`           | `SizedBox(height: 8)`                      | 8dp         |
| `mb-4`           | `SizedBox(height: 16)`                     | 16dp        |
| `mb-5`           | `SizedBox(height: 20)`                     | 20dp        |
| `mb-14`          | `SizedBox(height: 56)`                     | 56dp        |
| `mb-20`          | `SizedBox(height: 80)`                     | 80dp        |
| `p-3`            | `EdgeInsets.all(12)`                       | 12dp        |
| `p-5`            | `EdgeInsets.all(20)`                       | 20dp        |
| `p-6`            | `EdgeInsets.all(24)`                       | 24dp        |
| `max-w-5xl`      | `ConstrainedBox(maxWidth: 1024)`           | 1024dp      |
| `max-w-xl`       | `ConstrainedBox(maxWidth: 576)`            | 576dp       |
| `rounded-xl`     | `BorderRadius.circular(12)`               | 12dp        |
| `rounded-md`     | `BorderRadius.circular(6)`                | 6dp         |
| `rounded-full`   | `BorderRadius.circular(999)`              | 999dp       |
| `text-xs`        | `fontSize: 12`                             | 12dp        |
| `text-sm`        | `fontSize: 14`                             | 14dp        |
| `text-base`      | `fontSize: 16`                             | 16dp        |
| `text-lg`        | `fontSize: 18`                             | 18dp        |
| `text-xl`        | `fontSize: 20`                             | 20dp        |
| `text-2xl`       | `fontSize: 24`                             | 24dp        |
| `text-3xl`       | `fontSize: 30`                             | 30dp        |
| `text-5xl`       | `fontSize: 48`                             | 48dp        |
| `text-7xl`       | `fontSize: 72`                             | 72dp        |
| `font-medium`    | `FontWeight.w500`                          | 500         |
| `font-semibold`  | `FontWeight.w600`                          | 600         |
| `font-bold`      | `FontWeight.w700`                          | 700         |
| `leading-tight`  | `height: 1.1`                              | 1.1         |
| `leading-relaxed`| `height: 1.6`                              | 1.6         |
| `tracking-tight` | `letterSpacing: -0.3`                      | ~-0.02em    |
| `tracking-wider` | `letterSpacing: 0.8`                       | ~0.05em     |
| `backdrop-blur-lg`| `BackdropFilter(filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12))` | 12 |

### 7.3 Estrutura de Arquivos Sugerida (Flutter)

```
lib/
  main.dart
  app.dart
  theme/
    app_colors.dart        # Todas as cores do design system
    app_typography.dart    # Estilos de texto
    app_theme.dart         # ThemeData completo
  widgets/
    header.dart
    hero_section.dart
    phone_mockup.dart      # Widget separado para o mockup
    about_section.dart
    highlight_card.dart
    projects_section.dart
    featured_project.dart
    project_card.dart
    experience_section.dart
    timeline_item.dart
    contact_section.dart
    footer.dart
    section_title.dart     # Widget reutilizavel "01. Titulo ---"
    social_icons.dart      # Widget reutilizavel de icones sociais
    tech_tag.dart           # Widget reutilizavel de tag
    animated_section.dart  # Wrapper com VisibilityDetector + AnimationController
  data/
    projects_data.dart     # Lista de projetos
    experience_data.dart   # Lista de experiencias
    tech_data.dart         # Lista de tecnologias
  utils/
    svg_icons.dart         # Icones como constantes SVG ou CustomPainters
```

### 7.4 Exemplo de app_colors.dart

```dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color background    = Color(0xFF1A2332);
  static const Color foreground    = Color(0xFFE0E8F0);
  static const Color card          = Color(0xFF1F2B3D);
  static const Color primary       = Color(0xFF5EEAD4);
  static const Color primary10     = Color(0x1A5EEAD4);
  static const Color primary20     = Color(0x335EEAD4);
  static const Color primary05     = Color(0x0D5EEAD4);
  static const Color secondary     = Color(0xFF253347);
  static const Color mutedFg       = Color(0xFF7A8BA3);
  static const Color border        = Color(0xFF2D3E54);
  static const Color border50      = Color(0x802D3E54);
}
```
