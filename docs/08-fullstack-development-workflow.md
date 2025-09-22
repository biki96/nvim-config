# 🚀 Full-Stack Development Workflow Guide

Complete example of developing a modern full-stack application using your Neovim + tmux setup with professional tools and workflows.

## 🎯 Tech Stack Example

**Framework:** Next.js 15.5 (App Router, Turbopack, RSC)
**Runtime:** Node.js 20 LTS / Edge Runtime
**Language:** TypeScript 5.9 (strict mode)
**Package Manager:** pnpm 9.x
**Database:** PostgreSQL + Prisma ORM
**Styling:** Tailwind CSS
**Authentication:** NextAuth.js v5
**Deployment:** Vercel

---

## 🏗️ Project Setup Workflow

### **Step 1: Multi-Monitor Session Setup**

**Monitor 1: Development Session**
```bash
# Create main development session
tmux new-session -s fullstack-dev

# Create panes for development
Ctrl-b "        # Split horizontal
Ctrl-b %        # Split vertical (on bottom pane)

# Pane layout:
# ┌─────────────────────┐
# │    Neovim (Main)    │
# ├──────────┬──────────┤
# │ Terminal │  Claude  │
# │   Git    │   Code   │
# └──────────┴──────────┘
```

**Monitor 2: Monitoring Session**
```bash
# Create monitoring session
tmux new-session -s fullstack-monitor

# Create panes for monitoring
Ctrl-b "        # Split horizontal
Ctrl-b %        # Split vertical

# Pane layout:
# ┌─────────────────────┐
# │   Dev Server Logs   │
# ├──────────┬──────────┤
# │ Database │   Tests  │
# │   Logs   │ Coverage │
# └──────────┴──────────┘
```

### **Step 2: Project Initialization from Neovim**

**In Monitor 1, Neovim pane:**
```bash
# Open terminal in Neovim
<leader>h

# Create Next.js project with latest features
pnpm create next-app@latest my-fullstack-app --typescript --tailwind --eslint --app --src-dir --turbopack --import-alias "@/*"

cd my-fullstack-app

# Initialize Git repository
git init
git add .
git commit -m "feat: initial Next.js 15.5 setup with Turbopack

- TypeScript 5.9 strict mode
- App Router architecture
- Tailwind CSS integration
- pnpm package manager
- Turbopack for fast compilation"

# Exit terminal and open project
Ctrl-x
:cd my-fullstack-app
<leader>gg      # Open Neogit to see project structure
```

### **Step 3: Development Environment Setup**

**Configure TypeScript (tsconfig.json):**
```typescript
{
  "compilerOptions": {
    "target": "ES2022",
    "lib": ["dom", "dom.iterable", "es6"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [{ "name": "next" }],
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"],
      "@/components/*": ["./src/components/*"],
      "@/lib/*": ["./src/lib/*"],
      "@/types/*": ["./src/types/*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
```

### **Step 4: Database & Backend Setup**

**In Neovim terminal:**
```bash
# Add backend dependencies
pnpm add prisma @prisma/client
pnpm add -D @types/node

# Add authentication
pnpm add next-auth@beta
pnpm add @auth/prisma-adapter

# Initialize Prisma
npx prisma init

# Setup environment variables
<leader>e       # Focus file explorer
# Create .env.local
```

**Environment Configuration (.env.local):**
```env
# Database
DATABASE_URL="postgresql://username:password@localhost:5432/myapp?schema=public"

# NextAuth.js
NEXTAUTH_SECRET="your-secret-key-here"
NEXTAUTH_URL="http://localhost:3000"

# OAuth Providers
GITHUB_ID="your-github-client-id"
GITHUB_SECRET="your-github-client-secret"
```

### **Step 5: Multi-Pane Development Workflow**

**Monitor 1 Setup:**
```bash
# Pane 1: Neovim with project files
nvim src/app/page.tsx

# Pane 2: Terminal for commands
<space>Ctrl-j   # Switch to terminal pane
pnpm dev --turbopack

# Pane 3: Claude Code for AI assistance
<space>Ctrl-l   # Switch to Claude pane
claude
```

**Monitor 2 Setup:**
```bash
# Switch to monitoring session
Alt-)           # Next session

# Pane 1: Development server logs
tail -f .next/trace

# Pane 2: Database operations
psql -d myapp
# or
npx prisma studio

# Pane 3: Test runner
pnpm test --watch
```

---

## 🛠️ Daily Development Workflow

### **Morning Startup Routine**

**1. Start Development Environment:**
```bash
# Monitor 1: Resume development session
tmux attach -t fullstack-dev || tmux new-session -s fullstack-dev

# Navigate to project
cd my-fullstack-app

# Start Neovim
nvim

# Check Git status
<leader>gg      # Neogit interface
<leader>gl      # Git pull latest changes
```

**2. Start Services:**
```bash
# In terminal pane
<leader>h       # Open terminal in Neovim

# Start development server with Turbopack
pnpm dev --turbopack

# In another terminal (Ctrl-x to exit, then new terminal)
<leader>v       # Vertical terminal

# Start database
sudo systemctl start postgresql
# or for Docker:
docker-compose up -d postgres
```

**3. Monitor Setup:**
```bash
# Switch to monitoring session
Alt-)           # Switch sessions

# Start monitoring tools
npm run test:watch      # Test watcher
npx prisma studio      # Database GUI
```

### **Feature Development Cycle**

**1. Planning with AI Assistance:**
```bash
# In Claude Code pane
<space>cc       # Open Claude Code

# Ask Claude:
"I need to implement user authentication with NextAuth.js v5.
- Show me the app router setup
- Database schema with Prisma
- TypeScript types
- Server actions for auth"
```

**2. Implementation with Git Integration:**
```bash
# Create feature branch
<leader>gs      # Git status
:Git checkout -b feature/auth-system

# Code in Neovim with LSP support
<leader>ff      # Find files
# Edit: src/app/api/auth/[...nextauth]/route.ts

# Stage changes as you work
]c              # Next git hunk
<leader>hp      # Preview hunk
<leader>hs      # Stage hunk
```

**3. Real-time Development with Hot Reload:**
```vim
" In Neovim, split view for multiple files
:split src/lib/auth.ts
:vsplit src/components/LoginForm.tsx

" Use Ctrl-h/j/k/l to navigate between splits
" Turbopack provides instant hot reload
```

**4. Database Operations:**
```bash
# In database pane (Monitor 2)
# Edit Prisma schema
nvim prisma/schema.prisma

# Generate migration
npx prisma migrate dev --name add_user_auth

# Check database
npx prisma studio
```

### **Testing & Quality Assurance**

**1. Run Tests with Coverage:**
```bash
# In test pane
pnpm test               # Run all tests
pnpm test:coverage      # Coverage report
pnpm test:e2e          # End-to-end tests
```

**2. Code Quality Checks:**
```bash
# In Neovim terminal
<leader>h

# TypeScript check
pnpm type-check

# Linting
pnpm lint

# Format code
<leader>f       # Format current file with LSP
# or
pnpm format     # Format entire project
```

**3. Performance Monitoring:**
```bash
# In monitoring pane
# Watch bundle analysis
pnpm analyze

# Check lighthouse scores
pnpm lighthouse

# Monitor server performance
htop            # System resources
```

---

## 🎯 Advanced Workflows

### **Database Schema Development**

**1. Schema Design in Neovim:**
```prisma
// prisma/schema.prisma
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

model User {
  id            String    @id @default(cuid())
  name          String?
  email         String    @unique
  emailVerified DateTime?
  image         String?
  accounts      Account[]
  sessions      Session[]
  posts         Post[]

  @@map("users")
}

model Post {
  id        String   @id @default(cuid())
  title     String
  content   String?
  published Boolean  @default(false)
  author    User     @relation(fields: [authorId], references: [id])
  authorId  String
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  @@map("posts")
}
```

**2. Type-Safe Database Operations:**
```typescript
// src/lib/db.ts
import { PrismaClient } from '@prisma/client'

const globalForPrisma = globalThis as unknown as {
  prisma: PrismaClient | undefined
}

export const prisma = globalForPrisma.prisma ?? new PrismaClient()

if (process.env.NODE_ENV !== 'production') globalForPrisma.prisma = prisma

// src/lib/actions.ts
'use server'

import { prisma } from '@/lib/db'
import { revalidatePath } from 'next/cache'

export async function createPost(formData: FormData) {
  const title = formData.get('title') as string
  const content = formData.get('content') as string

  await prisma.post.create({
    data: {
      title,
      content,
      authorId: 'user-id', // Get from auth
    },
  })

  revalidatePath('/posts')
}
```

### **Component Development with RSC**

**1. Server Components:**
```typescript
// src/app/posts/page.tsx
import { prisma } from '@/lib/db'
import { PostCard } from '@/components/PostCard'

export default async function PostsPage() {
  const posts = await prisma.post.findMany({
    include: { author: true },
    orderBy: { createdAt: 'desc' },
  })

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-8">Latest Posts</h1>
      <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
        {posts.map((post) => (
          <PostCard key={post.id} post={post} />
        ))}
      </div>
    </div>
  )
}
```

**2. Client Components with Interactivity:**
```typescript
// src/components/PostCard.tsx
'use client'

import { useState } from 'react'
import { Heart, MessageCircle, Share } from 'lucide-react'

interface PostCardProps {
  post: {
    id: string
    title: string
    content: string | null
    author: { name: string | null }
    createdAt: Date
  }
}

export function PostCard({ post }: PostCardProps) {
  const [liked, setLiked] = useState(false)

  return (
    <div className="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow">
      <h2 className="text-xl font-semibold mb-2">{post.title}</h2>
      <p className="text-gray-600 mb-4">{post.content}</p>

      <div className="flex items-center justify-between">
        <span className="text-sm text-gray-500">
          By {post.author.name} • {post.createdAt.toLocaleDateString()}
        </span>

        <div className="flex gap-2">
          <button
            onClick={() => setLiked(!liked)}
            className={`p-2 rounded-full ${liked ? 'text-red-500' : 'text-gray-400'}`}
          >
            <Heart className="w-4 h-4" />
          </button>
          <button className="p-2 rounded-full text-gray-400">
            <MessageCircle className="w-4 h-4" />
          </button>
          <button className="p-2 rounded-full text-gray-400">
            <Share className="w-4 h-4" />
          </button>
        </div>
      </div>
    </div>
  )
}
```

### **API Routes with Edge Runtime**

**1. Modern API Route:**
```typescript
// src/app/api/posts/route.ts
import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/db'

export const runtime = 'edge'

export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url)
  const page = parseInt(searchParams.get('page') ?? '1')
  const limit = parseInt(searchParams.get('limit') ?? '10')

  try {
    const posts = await prisma.post.findMany({
      skip: (page - 1) * limit,
      take: limit,
      include: { author: true },
      orderBy: { createdAt: 'desc' },
    })

    return NextResponse.json(posts)
  } catch (error) {
    return NextResponse.json(
      { error: 'Failed to fetch posts' },
      { status: 500 }
    )
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { title, content, authorId } = body

    const post = await prisma.post.create({
      data: { title, content, authorId },
      include: { author: true },
    })

    return NextResponse.json(post, { status: 201 })
  } catch (error) {
    return NextResponse.json(
      { error: 'Failed to create post' },
      { status: 500 }
    )
  }
}
```

---

## 🔄 Git Workflow Integration

### **Feature Branch Workflow**

**1. Start New Feature:**
```bash
# In Neovim
<leader>gg      # Open Neogit
c               # Create branch (in Neogit)
# Type: feature/user-posts
```

**2. Development with Commits:**
```bash
# As you develop, stage hunks
]c              # Navigate to changes
<leader>hs      # Stage individual hunks
<leader>gc      # Commit with descriptive message
```

**3. Pull Request Ready:**
```bash
# Before PR, ensure quality
<leader>h       # Terminal
pnpm lint       # Fix linting
pnpm test       # All tests pass
pnpm type-check # TypeScript check
pnpm build      # Production build test

# Push and create PR
<leader>gp      # Git push
```

### **Code Review Process**

**1. Review Changes:**
```bash
<leader>gv      # Open Diffview
<leader>gh      # File history
<leader>gb      # Toggle blame for context
```

**2. Address Feedback:**
```bash
# Make changes in response to review
<leader>hs      # Stage fixes
<leader>gc      # Commit fixes
<leader>gp      # Push updates
```

---

## 🚀 Deployment Workflow

### **Production Preparation**

**1. Build Optimization:**
```bash
# Test production build locally
pnpm build
pnpm start

# Analyze bundle
pnpm analyze

# Check bundle size
ls -la .next/static/chunks/
```

**2. Environment Setup:**
```bash
# Production environment variables
# In .env.production
DATABASE_URL="production-db-url"
NEXTAUTH_URL="https://yourapp.com"
```

### **Vercel Deployment**

**1. Deploy from Terminal:**
```bash
# Install Vercel CLI
pnpm add -g vercel

# Deploy
vercel --prod

# Monitor deployment
vercel logs
```

**2. Database Migration:**
```bash
# Run production migrations
npx prisma migrate deploy

# Seed production data if needed
npx prisma db seed
```

---

## 💡 Pro Tips & Best Practices

### **Neovim + LSP Optimization**

**1. TypeScript Performance:**
```lua
-- In your LSP config
require('lspconfig').tsserver.setup({
  settings = {
    typescript = {
      preferences = {
        includePackageJsonAutoImports = "on",
      },
    },
  },
})
```

**2. Auto-imports and Code Actions:**
```bash
# In Neovim
<leader>ca      # Code actions (auto-import, quick fixes)
<leader>rn      # Rename symbol across project
gd              # Go to definition
gr              # Find references
```

### **Multi-Monitor Efficiency**

**1. Context Switching:**
```bash
# Monitor 1: Active development
# - Main editor with code
# - Git operations
# - Claude assistance

# Monitor 2: Continuous feedback
# - Test results
# - Server logs
# - Database queries
# - Performance metrics
```

**2. Session Management:**
```bash
# Save session state
Ctrl-b s        # List sessions
Alt-s           # Quick session chooser

# Project-specific sessions
tmux new-session -s project-frontend
tmux new-session -s project-backend
tmux new-session -s project-testing
```

### **Productivity Shortcuts**

**Daily Workflow Commands:**
```bash
# Quick file navigation
<leader>ff      # Find files
<leader>fg      # Find in files (grep)
<leader>fb      # Find buffers

# Git operations
]c              # Next hunk
<leader>hs      # Stage hunk
<leader>gc      # Commit
<leader>gp      # Push

# Code quality
<leader>f       # Format
<leader>ca      # Code actions
gd              # Go to definition
```

---

## 🎯 Complete Example Project Structure

```
my-fullstack-app/
├── src/
│   ├── app/
│   │   ├── api/
│   │   │   ├── auth/[...nextauth]/route.ts
│   │   │   └── posts/route.ts
│   │   ├── posts/
│   │   │   ├── [id]/page.tsx
│   │   │   └── page.tsx
│   │   ├── globals.css
│   │   ├── layout.tsx
│   │   └── page.tsx
│   ├── components/
│   │   ├── ui/
│   │   ├── PostCard.tsx
│   │   └── Navigation.tsx
│   ├── lib/
│   │   ├── actions.ts
│   │   ├── auth.ts
│   │   └── db.ts
│   └── types/
│       └── index.ts
├── prisma/
│   ├── schema.prisma
│   └── migrations/
├── public/
├── .env.local
├── .env.example
├── next.config.js
├── package.json
├── tailwind.config.js
├── tsconfig.json
└── README.md
```

This workflow gives you a professional, efficient development environment that scales from solo projects to enterprise applications! 🚀

---

*💡 Remember: This setup combines the power of modern tools (Next.js 15.5, TypeScript 5.9, pnpm 9.x) with the efficiency of your Neovim + tmux environment. The result is a development experience that rivals any IDE while maintaining terminal-based flexibility.*