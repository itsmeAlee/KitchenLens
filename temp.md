# 1. KitchenLens-Onboarding1 - Before Login, When user opens without login

<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens - Onboarding Step 3</title>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#19e65e",
                        "background-light": "#f6f8f6",
                        "background-dark": "#112116",
                        "surface-light": "#ffffff",
                        "surface-dark": "#1a2c20",
                    },
                    fontFamily: {
                        "display": ["Manrope", "sans-serif"]
                    },
                    borderRadius: {"DEFAULT": "1rem", "lg": "2rem", "xl": "3rem", "full": "9999px"},
                },
            },
        }
    </script>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-slate-100 antialiased overflow-hidden">
<div class="relative flex h-full min-h-screen w-full flex-col justify-between overflow-hidden bg-background-light dark:bg-background-dark group/design-root">
<!-- Background Gradient Decor -->
<div class="absolute top-0 left-0 w-full h-[60vh] bg-gradient-to-b from-white to-transparent dark:from-background-dark dark:to-transparent z-0 opacity-80"></div>
<div class="absolute bottom-0 left-0 w-full h-[40vh] bg-gradient-to-t from-primary/10 to-transparent z-0"></div>
<!-- Header / Logo -->
<div class="relative z-10 flex w-full flex-row items-center justify-center pt-12 pb-4">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-primary text-3xl">lens_blur</span>
<span class="text-lg font-bold tracking-tight text-slate-900 dark:text-white">KitchenLens</span>
</div>
</div>
<!-- Main Content Area -->
<div class="relative z-10 flex flex-1 flex-col items-center justify-center px-6 @container">
<!-- Hero Illustration Container -->
<div class="w-full max-w-sm aspect-[4/5] relative flex items-center justify-center mb-6">
<!-- Abstract Background Shapes -->
<div class="absolute inset-0 bg-gradient-to-tr from-green-50 to-green-100 dark:from-green-900/20 dark:to-green-800/20 rounded-full blur-3xl opacity-60"></div>
<!-- Main Image Card with Lens Effect -->
<div class="relative w-full h-full max-h-[420px] rounded-[2.5rem] overflow-hidden shadow-xl shadow-green-900/5 dark:shadow-black/20 transform transition-transform duration-700 hover:scale-[1.02]">
<!-- Image -->
<div class="absolute inset-0 bg-cover bg-center" data-alt="Fresh vegetables and ingredients laid out on a clean kitchen counter" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuARqtoe82tw_mQR7UxhEuLIMP1t0PtyibS-SGBTq8c8-h8Wra8DVe2p02TTvqUXHP6eL6rfxf0kBPH0rOmYNwdGHYKkOeQ8unN0jWTpw7DdC0HJ-eBL0IO2CD_wOv2FhJQIgzGN204uorIMkIG025hJ4fI7f9cLzS3Z6CPD2AYLC_QJTPr3lvEEcIgwsgmmF5aAPIAdo08Zt-uOaN-nHGfw_DRQzoxKdpCfMrIXpc541sdbHJ2BfeRpnYoKDE3lb0YyIBNJqHp_b_7S");'>
</div>
<!-- Overlay Gradient -->
<div class="absolute inset-0 bg-gradient-to-b from-transparent via-transparent to-black/60"></div>
<!-- Lens UI Overlay -->
<div class="absolute inset-0 p-6 flex flex-col justify-between">
<!-- Top Corners -->
<div class="flex justify-between">
<div class="w-8 h-8 border-l-4 border-t-4 border-primary rounded-tl-lg"></div>
<div class="w-8 h-8 border-r-4 border-t-4 border-primary rounded-tr-lg"></div>
</div>
<!-- Scanning line / Focus Area -->
<div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-48 h-48 border border-primary/50 rounded-xl flex items-center justify-center bg-white/10 backdrop-blur-sm">
<div class="absolute -top-3 bg-primary text-slate-900 text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wider">Analysis Complete</div>
<div class="text-white text-center">
<span class="material-symbols-outlined text-4xl mb-1 animate-pulse">auto_awesome</span>
<p class="text-xs font-medium">Matching Inventory...</p>
</div>
</div>
<!-- Bottom Corners -->
<div class="flex justify-between items-end">
<div class="w-8 h-8 border-l-4 border-b-4 border-primary rounded-bl-lg"></div>
<!-- Floating Tag -->
<div class="bg-white/90 dark:bg-slate-800/90 backdrop-blur-md px-3 py-2 rounded-lg flex items-center gap-2 shadow-lg mb-2 mr-2">
<div class="w-2 h-2 rounded-full bg-green-500"></div>
<span class="text-xs font-bold text-slate-800 dark:text-white">Avocado Toast</span>
</div>
<div class="w-8 h-8 border-r-4 border-b-4 border-primary rounded-br-lg"></div>
</div>
</div>
</div>
</div>
<!-- Text Content -->
<div class="w-full max-w-md text-center space-y-4 mb-4">
<h1 class="text-slate-900 dark:text-white tracking-tight text-3xl @[400px]:text-4xl font-extrabold leading-tight">
                    Intelligent <br/>
<span class="text-transparent bg-clip-text bg-gradient-to-r from-green-600 to-primary">Recipe Discovery</span>
</h1>
<p class="text-slate-500 dark:text-slate-400 text-base @[400px]:text-lg font-medium leading-relaxed max-w-[320px] mx-auto">
                    Reasoning about recipes tailored to your unique dietary profile and inventory.
                </p>
</div>
<!-- Page Indicators -->
<div class="flex w-full flex-row items-center justify-center gap-2 py-4">
<div class="h-2 w-2 rounded-full bg-slate-200 dark:bg-slate-700 transition-colors"></div>
<div class="h-2 w-2 rounded-full bg-slate-200 dark:bg-slate-700 transition-colors"></div>
<div class="h-2 w-8 rounded-full bg-primary transition-all"></div>
</div>
</div>
<!-- Footer / Action Area -->
<div class="relative z-10 w-full px-6 pb-10 pt-2 bg-gradient-to-t from-background-light via-background-light to-transparent dark:from-background-dark dark:via-background-dark">
<div class="max-w-md mx-auto flex flex-col gap-4">
<button class="group relative flex w-full cursor-pointer items-center justify-center overflow-hidden rounded-full h-14 bg-primary text-slate-900 shadow-lg shadow-green-500/20 transition-all active:scale-[0.98] hover:shadow-green-500/30">
<span class="absolute inset-0 bg-white/20 opacity-0 group-hover:opacity-100 transition-opacity"></span>
<span class="text-lg font-bold leading-normal tracking-wide z-10">Get Started</span>
<span class="material-symbols-outlined ml-2 z-10">arrow_forward</span>
</button>
<div class="flex items-center justify-center gap-1 py-2">
<span class="text-slate-500 dark:text-slate-400 text-sm font-medium">Already have an account?</span>
<a class="text-slate-900 dark:text-white text-sm font-bold hover:underline decoration-2 underline-offset-4 decoration-primary transition-all" href="#">Sign In</a>
</div>
</div>
<!-- Safe Area Spacer for iOS Home Indicator -->
<div class="h-4 w-full"></div>
</div>
</div>
</body></html>




# 2. KitchenLens Welcome & Auth

<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens Welcome &amp; Auth</title>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet"/>
<!-- Material Symbols -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Theme Config -->
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#19e65e",
                        "primary-dark": "#14b84b",
                        "background-light": "#f6f8f6",
                        "background-dark": "#112116",
                        "glass-border": "rgba(255, 255, 255, 0.4)",
                        "glass-bg": "rgba(255, 255, 255, 0.75)",
                        "glass-bg-dark": "rgba(17, 33, 22, 0.75)",
                    },
                    fontFamily: {
                        "display": ["Manrope", "sans-serif"]
                    },
                    borderRadius: {"DEFAULT": "1rem", "lg": "2rem", "xl": "3rem", "2xl": "4rem", "full": "9999px"},
                    backdropBlur: {
                        'xs': '2px',
                    }
                },
            },
        }
    </script>
<style>
        .glass-card {
            background: rgba(255, 255, 255, 0.65);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.5);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.07);
        }
        
        .dark .glass-card {
            background: rgba(17, 33, 22, 0.65);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="font-display bg-background-light dark:bg-background-dark text-slate-900 dark:text-slate-100 antialiased selection:bg-primary/30">
<!-- Main Container: Full viewport height, relative for absolute positioning of background -->
<main class="relative flex min-h-screen w-full flex-col overflow-hidden">
<!-- Background Image with Blur -->
<div class="absolute inset-0 z-0">
<div class="h-full w-full bg-cover bg-center bg-no-repeat scale-105" data-alt="Blurred bright modern kitchen background with white marble and green herbs" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAE7cd_IugnuASu951DnmjnX66Ljw5h5J_3jDt0rmz-YS-AU4znOlh36Wo3hcXO8TT9gAFBefFDFD72gU5kbOscQB7FTYMpkyENdvCfLoFh9DGjdWitBDSkuKI6eQg0pepB74y7PAOfz46UExSeR-0YYFy3lzGC7l81UlT7KgBDdIL8-RjSDHktHnZHB-6bMDQXGbI8M44j2NTHj8G3sxNihf3zYiiYPX3iYRxflGEtw3aISG9Zuwka-9Y-BgrdO2enLJvZI3ns_aeN");'></div>
<!-- Overlay to ensure text readability and theme tint -->
<div class="absolute inset-0 bg-white/30 dark:bg-black/40 backdrop-blur-sm"></div>
</div>
<!-- Content Area -->
<div class="relative z-10 flex flex-1 flex-col items-center justify-center p-6 w-full max-w-md mx-auto h-full">
<!-- Logo Section -->
<div class="mb-8 flex flex-col items-center animate-fade-in-down">
<div class="flex h-16 w-16 items-center justify-center rounded-2xl bg-white/90 shadow-sm backdrop-blur-md mb-4 text-primary">
<span class="material-symbols-outlined text-4xl">lens_blur</span>
</div>
<h1 class="text-3xl font-bold tracking-tight text-slate-900 dark:text-white drop-shadow-sm">KitchenLens</h1>
<p class="mt-2 text-sm font-medium text-slate-700/80 dark:text-slate-200/80">Smart Kitchen AI Assistant</p>
</div>
<!-- Glass Card Container -->
<div class="glass-card w-full rounded-[2rem] p-1 shadow-xl">
<!-- Tab Switcher -->
<div class="relative mb-6 flex w-full rounded-xl bg-slate-100/50 dark:bg-slate-800/50 p-1.5">
<div class="absolute inset-y-1.5 left-1.5 w-[calc(50%-6px)] rounded-xl bg-white dark:bg-slate-700 shadow-sm transition-transform duration-300 ease-out translate-x-0"></div>
<button class="relative z-10 flex-1 py-3 text-center text-sm font-bold text-slate-900 dark:text-white transition-colors">
                        Login
                    </button>
<button class="relative z-10 flex-1 py-3 text-center text-sm font-bold text-slate-500 hover:text-slate-700 dark:text-slate-400 dark:hover:text-slate-200 transition-colors">
                        Sign Up
                    </button>
</div>
<!-- Form Content -->
<div class="px-5 pb-6 pt-2">
<form class="flex flex-col gap-5" onsubmit="event.preventDefault()">
<!-- Email Input -->
<div class="group relative">
<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4 text-slate-400 group-focus-within:text-primary transition-colors">
<span class="material-symbols-outlined text-[20px]">mail</span>
</div>
<input class="w-full rounded-full border border-slate-200/60 bg-white/80 dark:bg-slate-900/60 dark:border-slate-700 py-4 pl-11 pr-4 text-slate-900 dark:text-white placeholder:text-slate-400 focus:border-primary focus:ring-2 focus:ring-primary/20 focus:bg-white dark:focus:bg-slate-900 transition-all outline-none" placeholder="Email address" type="email"/>
</div>
<!-- Password Input -->
<div class="group relative">
<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4 text-slate-400 group-focus-within:text-primary transition-colors">
<span class="material-symbols-outlined text-[20px]">lock</span>
</div>
<input class="w-full rounded-full border border-slate-200/60 bg-white/80 dark:bg-slate-900/60 dark:border-slate-700 py-4 pl-11 pr-4 text-slate-900 dark:text-white placeholder:text-slate-400 focus:border-primary focus:ring-2 focus:ring-primary/20 focus:bg-white dark:focus:bg-slate-900 transition-all outline-none" placeholder="Password" type="password"/>
<button class="absolute inset-y-0 right-0 flex items-center pr-4 text-slate-400 hover:text-slate-600 dark:hover:text-slate-200" type="button">
<span class="material-symbols-outlined text-[20px]">visibility_off</span>
</button>
</div>
<!-- Forgot Password Link -->
<div class="flex justify-end">
<a class="text-xs font-semibold text-slate-600 hover:text-primary dark:text-slate-300 dark:hover:text-primary transition-colors" href="#">
                                Forgot Password?
                            </a>
</div>
<!-- Primary Button -->
<button class="group relative mt-2 w-full overflow-hidden rounded-full bg-gradient-to-r from-primary to-primary-dark py-4 text-slate-900 shadow-lg shadow-primary/25 transition-all hover:shadow-primary/40 active:scale-[0.98]">
<span class="relative z-10 flex items-center justify-center gap-2 text-base font-bold">
                                Get Started
                                <span class="material-symbols-outlined text-lg transition-transform group-hover:translate-x-1">arrow_forward</span>
</span>
<div class="absolute inset-0 bg-white/20 opacity-0 transition-opacity group-hover:opacity-100"></div>
</button>
</form>
<!-- Divider -->
<div class="my-6 flex items-center gap-4">
<div class="h-px flex-1 bg-slate-300/50 dark:bg-slate-600/50"></div>
<span class="text-xs font-medium text-slate-500 dark:text-slate-400">Or continue with</span>
<div class="h-px flex-1 bg-slate-300/50 dark:bg-slate-600/50"></div>
</div>
<!-- Social Login -->
<div class="flex justify-center gap-4">
<button class="flex h-12 w-12 items-center justify-center rounded-full bg-white dark:bg-slate-800 shadow-sm border border-slate-200/50 dark:border-slate-600 transition-transform hover:-translate-y-0.5 hover:shadow-md">
<img alt="Google" class="h-6 w-6" data-alt="Google logo icon" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCyF7WTNLa03J1uC2-bBHj8lmVM1n8RMQ8iGidgmHVGFf0UNRKEwVL1XxSHyLYE63zIYAQppZNfpTGMujpcQnwcit6HuCYR7-RtB83wuBfP15eCFlFRdu7mWrGKAcKHKirBK3BHx4l3fzmOMrN9koo9z9_QQODIy2wtIwNNt-Cuc0QqGf6DYEnjoOcddpEefdj8mOCDSmX7Bcw1i87qWJt1VCSa5B8GEz7VKQhRmyEoXk7HJUtXpRveKY_D5nnbwFzrmi44tv8b8sez"/>
</button>
<button class="flex h-12 w-12 items-center justify-center rounded-full bg-white dark:bg-slate-800 shadow-sm border border-slate-200/50 dark:border-slate-600 transition-transform hover:-translate-y-0.5 hover:shadow-md">
<svg class="h-6 w-6 text-slate-900 dark:text-white" fill="currentColor" viewbox="0 0 24 24">
<path d="M12 2C6.477 2 2 6.477 2 12c0 4.42 2.865 8.17 6.84 9.49.5.09.68-.22.68-.48v-1.71c-2.78.6-3.37-1.34-3.37-1.34-.46-1.16-1.11-1.47-1.11-1.47-.9-.62.07-.6.07-.6 1 .07 1.53 1.03 1.53 1.03.89 1.52 2.34 1.08 2.91.83.09-.65.35-1.09.63-1.34-2.22-.25-4.55-1.11-4.55-4.94 0-1.1.39-1.99 1.03-2.69-.1-.26-.45-1.28.1-2.66 0 0 .84-.27 2.75 1.02a9.58 9.58 0 012.5-.34c.85.01 1.71.12 2.5.34 1.91-1.29 2.75-1.02 2.75-1.02.55 1.38.2 2.4.1 2.66.64.7 1.03 1.59 1.03 2.69 0 3.84-2.34 4.68-4.57 4.93.36.31.68.92.68 1.85v2.75c0 .27.18.58.69.48A10.01 10.01 0 0022 12c0-5.523-4.477-10-10-10z"></path>
</svg>
</button>
</div>
</div>
</div>
<!-- Footer Links -->
<div class="mt-8 text-center">
<p class="text-xs text-slate-800 dark:text-slate-200 font-medium">
                    By signing up, you agree to our 
                    <a class="underline decoration-slate-400 hover:text-primary transition-colors" href="#">Terms</a> 
                    &amp; 
                    <a class="underline decoration-slate-400 hover:text-primary transition-colors" href="#">Privacy Policy</a>
</p>
</div>
</div>
</main>
</body></html>




# 3. KitchenLens-Onboarding2-After login

<!DOCTYPE html>
<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens - Dietary Preferences</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#19e65e",
                        "background-light": "#f6f8f6",
                        "background-dark": "#112116",
                        "surface-light": "#ffffff",
                        "surface-dark": "#1a2c20",
                    },
                    fontFamily: {
                        "display": ["Manrope", "sans-serif"]
                    },
                    borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                },
            },
        }
    </script>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
    .scrollbar-hide::-webkit-scrollbar {
        display: none;
    }
    .scrollbar-hide {
        -ms-overflow-style: none;
        scrollbar-width: none;
    }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-slate-100 min-h-screen flex flex-col items-center justify-center antialiased">
<div class="relative flex h-full min-h-screen w-full max-w-md flex-col bg-surface-light dark:bg-surface-dark shadow-xl overflow-hidden mx-auto">
<div class="px-6 pt-12 pb-2">
<div class="flex w-full flex-row items-center justify-center gap-3 mb-8">
<div class="h-2 w-2 rounded-full bg-slate-200 dark:bg-slate-600"></div>
<div class="h-2 w-2 rounded-full bg-slate-200 dark:bg-slate-600"></div>
<div class="h-2 w-8 rounded-full bg-primary"></div>
</div>
<div class="space-y-2">
<h1 class="text-3xl font-bold tracking-tight text-slate-900 dark:text-white leading-tight">
                Dietary Preferences
            </h1>
<p class="text-base text-slate-500 dark:text-slate-400 font-medium leading-relaxed">
                Customize your experience. We'll tailor recipes and suggestions to fit your lifestyle.
            </p>
</div>
</div>
<div class="px-6 py-4">
<div class="relative">
<span class="absolute inset-y-0 left-0 flex items-center pl-3 text-slate-400">
<span class="material-symbols-outlined text-xl">search</span>
</span>
<input class="w-full rounded-xl bg-slate-100 dark:bg-slate-800 border-none py-3 pl-10 pr-4 text-sm font-medium text-slate-900 dark:text-white placeholder-slate-400 focus:ring-2 focus:ring-primary focus:ring-offset-0 outline-none" placeholder="Search diets, ingredients..." type="text"/>
</div>
</div>
<div class="flex-1 px-6 space-y-8 overflow-y-auto pb-6 scrollbar-hide">
<div class="space-y-3">
<h3 class="text-sm font-bold uppercase tracking-wider text-slate-400 dark:text-slate-500">Common Diets</h3>
<div class="flex flex-wrap gap-2.5">
<button class="flex items-center gap-2 rounded-full bg-primary px-4 py-2 text-sm font-semibold text-white dark:text-slate-900 shadow-md shadow-primary/20 transition-transform active:scale-95">
<span class="material-symbols-outlined text-lg">check</span>
                    Vegetarian
                </button>
<button class="flex items-center gap-2 rounded-full bg-slate-100 dark:bg-slate-800 border border-transparent hover:border-slate-300 dark:hover:border-slate-600 px-4 py-2 text-sm font-medium text-slate-700 dark:text-slate-300 transition-all active:scale-95">
                    Vegan
                </button>
<button class="flex items-center gap-2 rounded-full bg-slate-100 dark:bg-slate-800 border border-transparent hover:border-slate-300 dark:hover:border-slate-600 px-4 py-2 text-sm font-medium text-slate-700 dark:text-slate-300 transition-all active:scale-95">
                    Keto
                </button>
<button class="flex items-center gap-2 rounded-full bg-slate-100 dark:bg-slate-800 border border-transparent hover:border-slate-300 dark:hover:border-slate-600 px-4 py-2 text-sm font-medium text-slate-700 dark:text-slate-300 transition-all active:scale-95">
                    Paleo
                </button>
<button class="flex items-center gap-2 rounded-full bg-slate-100 dark:bg-slate-800 border border-transparent hover:border-slate-300 dark:hover:border-slate-600 px-4 py-2 text-sm font-medium text-slate-700 dark:text-slate-300 transition-all active:scale-95">
                    Gluten-Free
                </button>
<button class="flex items-center gap-2 rounded-full bg-slate-100 dark:bg-slate-800 border border-transparent hover:border-slate-300 dark:hover:border-slate-600 px-4 py-2 text-sm font-medium text-slate-700 dark:text-slate-300 transition-all active:scale-95">
                    Mediterranean
                </button>
</div>
</div>
<div class="space-y-3">
<h3 class="text-sm font-bold uppercase tracking-wider text-slate-400 dark:text-slate-500">Allergies &amp; Intolerances</h3>
<div class="grid grid-cols-2 gap-3">
<button class="group relative flex items-center gap-3 rounded-xl bg-primary/10 border-2 border-primary p-3 transition-all">
<div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-primary text-white dark:text-slate-900">
<span class="material-symbols-outlined">set_meal</span>
</div>
<div class="text-left">
<p class="text-sm font-bold text-slate-900 dark:text-white">Shellfish</p>
<p class="text-xs text-slate-500 dark:text-slate-400">Strict avoid</p>
</div>
<div class="absolute top-3 right-3 text-primary">
<span class="material-symbols-outlined text-lg">check_circle</span>
</div>
</button>
<button class="group relative flex items-center gap-3 rounded-xl bg-slate-50 dark:bg-slate-800/50 border border-slate-200 dark:border-slate-700 p-3 transition-all hover:bg-slate-100 dark:hover:bg-slate-800 active:scale-[0.98]">
<div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-slate-200 dark:bg-slate-700 text-slate-500 dark:text-slate-300">
<span class="material-symbols-outlined">nutrition</span>
</div>
<div class="text-left">
<p class="text-sm font-bold text-slate-700 dark:text-slate-300">Nuts</p>
<p class="text-xs text-slate-400 dark:text-slate-500">Peanuts, etc.</p>
</div>
</button>
<button class="group relative flex items-center gap-3 rounded-xl bg-slate-50 dark:bg-slate-800/50 border border-slate-200 dark:border-slate-700 p-3 transition-all hover:bg-slate-100 dark:hover:bg-slate-800 active:scale-[0.98]">
<div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-slate-200 dark:bg-slate-700 text-slate-500 dark:text-slate-300">
<span class="material-symbols-outlined">egg</span>
</div>
<div class="text-left">
<p class="text-sm font-bold text-slate-700 dark:text-slate-300">Eggs</p>
</div>
</button>
<button class="group relative flex items-center gap-3 rounded-xl bg-slate-50 dark:bg-slate-800/50 border border-slate-200 dark:border-slate-700 p-3 transition-all hover:bg-slate-100 dark:hover:bg-slate-800 active:scale-[0.98]">
<div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-slate-200 dark:bg-slate-700 text-slate-500 dark:text-slate-300">
<span class="material-symbols-outlined">water_drop</span>
</div>
<div class="text-left">
<p class="text-sm font-bold text-slate-700 dark:text-slate-300">Dairy</p>
</div>
</button>
<button class="group relative flex items-center gap-3 rounded-xl bg-slate-50 dark:bg-slate-800/50 border border-slate-200 dark:border-slate-700 p-3 transition-all hover:bg-slate-100 dark:hover:bg-slate-800 active:scale-[0.98]">
<div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-slate-200 dark:bg-slate-700 text-slate-500 dark:text-slate-300">
<span class="material-symbols-outlined">grain</span>
</div>
<div class="text-left">
<p class="text-sm font-bold text-slate-700 dark:text-slate-300">Soy</p>
</div>
</button>
<button class="group relative flex items-center gap-3 rounded-xl bg-slate-50 dark:bg-slate-800/50 border border-slate-200 dark:border-slate-700 p-3 transition-all hover:bg-slate-100 dark:hover:bg-slate-800 active:scale-[0.98]">
<div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-slate-200 dark:bg-slate-700 text-slate-500 dark:text-slate-300">
<span class="material-symbols-outlined">grass</span>
</div>
<div class="text-left">
<p class="text-sm font-bold text-slate-700 dark:text-slate-300">Wheat</p>
</div>
</button>
</div>
</div>
</div>
<div class="p-6 bg-surface-light dark:bg-surface-dark border-t border-slate-100 dark:border-slate-800 mt-auto z-10">
<button class="flex w-full items-center justify-center gap-2 rounded-xl bg-primary py-4 text-base font-bold text-white dark:text-slate-900 shadow-lg shadow-primary/25 transition-transform active:scale-[0.98] hover:bg-primary/90">
<span>Save Preferences</span>
</button>
<button class="mt-4 w-full text-center text-sm font-semibold text-slate-400 hover:text-slate-600 dark:hover:text-slate-300 transition-colors">
            Skip for now
        </button>
</div>
</div>

</body></html>



# 4. KitchenLens Onboarding 3 - Professional Access
<!DOCTYPE html>
<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens Professional Access</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet"/>
<script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#22C55E", // Vibrant green from the prompt/screenshot
                        "primary-dark": "#16A34A",
                        "background-light": "#F8FAFC",
                        "background-dark": "#121212",
                        "surface-light": "#FFFFFF",
                        "surface-dark": "#1E1E1E",
                        "surface-variant-light": "#F1F5F9",
                        "surface-variant-dark": "#2D2D2D",
                        "text-primary-light": "#0F172A",
                        "text-primary-dark": "#F8FAFC",
                        "text-secondary-light": "#64748B",
                        "text-secondary-dark": "#94A3B8",
                    },
                    fontFamily: {
                        sans: ["Inter", "sans-serif"],
                    },
                    borderRadius: {
                        'xl': '1rem',
                        '2xl': '1.5rem',
                        '3xl': '2rem',
                    },
                    boxShadow: {
                        'soft': '0 4px 20px -2px rgba(0, 0, 0, 0.05)',
                    }
                },
            },
        };
    </script>
<style>.toggle-checkbox:checked {
            right: 0;
            border-color: #22C55E;
        }
        .toggle-checkbox:checked + .toggle-label {
            background-color: #22C55E;
        }
        .toggle-checkbox {
            right: 0;
            z-index: 1;
            border-color: transparent;
            cursor: pointer;
            -webkit-appearance: none;
        }@keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fade-in {
            animation: fadeIn 0.5s ease-out forwards;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark font-sans h-screen flex flex-col justify-between overflow-hidden antialiased transition-colors duration-300">
<div class="pt-8 px-6 animate-fade-in">
<div class="flex justify-center gap-2 mb-8">
<div class="w-2 h-2 rounded-full bg-slate-200 dark:bg-zinc-700"></div>
<div class="w-8 h-2 rounded-full bg-primary"></div>
<div class="w-2 h-2 rounded-full bg-slate-200 dark:bg-zinc-700"></div>
</div>
<div class="text-center mb-8">
<h1 class="text-2xl font-bold text-text-primary-light dark:text-text-primary-dark tracking-tight mb-2">
                System Access
            </h1>
<p class="text-text-secondary-light dark:text-text-secondary-dark text-sm leading-relaxed max-w-xs mx-auto">
                Grant permissions to enable AI ingredient detection and recipe updates.
            </p>
</div>
</div>
<div class="flex-1 flex flex-col justify-center px-5 space-y-4 max-w-md mx-auto w-full animate-fade-in" style="animation-delay: 0.1s;">
<div class="group bg-surface-light dark:bg-surface-dark p-4 rounded-2xl shadow-soft dark:shadow-none border border-transparent dark:border-surface-variant-dark flex items-center justify-between transition-all active:scale-[0.98]">
<div class="flex items-center gap-4">
<div class="w-10 h-10 rounded-full bg-green-50 dark:bg-green-900/20 flex items-center justify-center text-primary shrink-0">
<span class="material-icons-round text-xl">photo_camera</span>
</div>
<div class="flex flex-col">
<span class="text-base font-semibold text-text-primary-light dark:text-text-primary-dark">Camera</span>
<span class="text-xs text-text-secondary-light dark:text-text-secondary-dark">For instant ingredient detection</span>
</div>
</div>
<div class="relative inline-block w-12 mr-2 align-middle select-none transition duration-200 ease-in">
<input checked="" class="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer checked:right-0 right-6 transition-all duration-300 ease-in-out" id="camera-toggle" name="toggle" type="checkbox"/>
<label class="toggle-label block overflow-hidden h-6 rounded-full bg-primary cursor-pointer transition-colors duration-300" for="camera-toggle"></label>
</div>
</div>
<div class="group bg-surface-light dark:bg-surface-dark p-4 rounded-2xl shadow-soft dark:shadow-none border border-transparent dark:border-surface-variant-dark flex items-center justify-between transition-all active:scale-[0.98]">
<div class="flex items-center gap-4">
<div class="w-10 h-10 rounded-full bg-green-50 dark:bg-green-900/20 flex items-center justify-center text-primary shrink-0">
<span class="material-icons-round text-xl">notifications_active</span>
</div>
<div class="flex flex-col">
<span class="text-base font-semibold text-text-primary-light dark:text-text-primary-dark">Notifications</span>
<span class="text-xs text-text-secondary-light dark:text-text-secondary-dark">Daily personalized recipe ideas</span>
</div>
</div>
<div class="relative inline-block w-12 mr-2 align-middle select-none transition duration-200 ease-in">
<input checked="" class="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer checked:right-0 right-6 transition-all duration-300 ease-in-out" id="notif-toggle" name="toggle" type="checkbox"/>
<label class="toggle-label block overflow-hidden h-6 rounded-full bg-primary cursor-pointer transition-colors duration-300" for="notif-toggle"></label>
</div>
</div>
<div class="mt-6 flex items-start gap-3 bg-blue-50 dark:bg-blue-900/10 p-3 rounded-xl border border-blue-100 dark:border-blue-900/30">
<span class="material-icons-round text-blue-600 dark:text-blue-400 text-lg mt-0.5">verified_user</span>
<p class="text-xs text-blue-900 dark:text-blue-200 leading-snug">
                We value your privacy. Data processing happens locally on your device for maximum security.
            </p>
</div>
</div>
<div class="pb-8 pt-4 px-6 animate-fade-in" style="animation-delay: 0.2s;">
<button class="w-full bg-primary hover:bg-primary-dark text-white font-semibold py-4 rounded-2xl shadow-lg shadow-green-500/20 dark:shadow-green-900/20 transition-all active:scale-[0.98] mb-4 text-base">
            Continue
        </button>
<button class="w-full py-2 text-sm font-medium text-text-secondary-light dark:text-text-secondary-dark hover:text-text-primary-light dark:hover:text-white transition-colors">
            Skip for now
        </button>
</div>

</body></html>




# 5. KitcheLens - Homepage

<!DOCTYPE html>
<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens AI Streamlined Home</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@200..800&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#19e65e",
                        "background-light": "#f6f8f6",
                        "background-dark": "#112116",
                    },
                    fontFamily: {
                        "display": ["Plus Jakarta Sans", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "1rem",
                        "lg": "2rem",
                        "xl": "3rem",
                        "full": "9999px"
                    },
                },
            },
        }
    </script>
<style>
        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }
        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-slate-100 antialiased selection:bg-primary/30">
<div class="relative mx-auto flex h-full min-h-screen w-full max-w-md flex-col overflow-hidden bg-background-light dark:bg-background-dark shadow-2xl">
<header class="flex items-center justify-between px-6 pt-12 pb-4">
<div class="flex items-center gap-3">
<div class="relative h-12 w-12 overflow-hidden rounded-full border-2 border-white dark:border-slate-700 shadow-sm">
<img alt="User Profile Chef Portrait" class="h-full w-full object-cover" data-alt="Portrait of a chef in a kitchen" src="https://lh3.googleusercontent.com/aida-public/AB6AXuC4UDx5eoY6VcGTA_Jd61iWOYxpqoDShkaSP1BVxVAb2wfM0CywUZP11pNwiLQbivzzqzP2f8RW3T53Sm3IjqVz78LQ2LBPQs-Euu2Txk25tGVYAIYfB4pNGPp1jcgtFd-9ogQjDOy2NWcKKodj6VQx7acVGV_iIVt0UVERsNDslhr69cGT9FS8zLDIbEMUIBMcKfkgb7QpFEwWQ_Eb4vji8jfChrE6_fal_uPcQf5N0HFMgcS42Ib8eYWoOklUFFv027TZOEY1fg2W"/>
</div>
<div>
<p class="text-sm font-medium text-slate-500 dark:text-slate-400">Good Afternoon,</p>
<h1 class="text-xl font-bold text-slate-900 dark:text-slate-100">Chef Alex</h1>
</div>
</div>
<button class="flex h-10 w-10 items-center justify-center rounded-full bg-white dark:bg-slate-800 shadow-sm transition-transform hover:scale-105">
<span class="material-symbols-outlined text-slate-900 dark:text-white" style="font-size: 24px;">notifications</span>
</button>
</header>
<main class="flex-1 overflow-y-auto pb-24 no-scrollbar">
<div class="px-4 py-4">
<div class="relative flex min-h-[420px] w-full flex-col items-center justify-end overflow-hidden rounded-[2.5rem] p-6 shadow-lg">
<div class="absolute inset-0 z-0">
<img alt="Fresh vegetables and fruits on kitchen counter" class="h-full w-full object-cover opacity-90 transition-transform duration-700 hover:scale-105" data-alt="Artistic shot of fresh colorful vegetables" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDUw-h7mB6Z2GyEJEcme-BEmYU7mtfb4mNF98fYpXGTaur22GI31vwTbZHrxbMxwrx-I5tJAnZEycKsG9smo183xHFld8_DVvwffkRPMsbHYMDdC5Eugmrrng6JIAwwz6hQpoh9cWtMquSDFc6Jf4nb5IEN6GdFI2tc7A3a3yL-J2ovW-wOyMvKKJzehhBuHsyKo2r1SKJ4-9dj3rxg-dl_zWcC60PKtNiAPh0Ct7vj1XWRbUrcJGzObjM43XgYiOShZVDXfFBEEyIk"/>
<div class="absolute inset-0 bg-gradient-to-b from-black/10 via-transparent to-black/70"></div>
</div>
<div class="relative z-10 flex w-full flex-col items-center text-center">
<h2 class="mb-1 text-3xl font-bold tracking-tight text-white drop-shadow-md">KitchenLens AI</h2>
<p class="mb-6 text-sm font-medium text-white/90">Ready to cook? Scan your ingredients.</p>
<button class="group relative flex w-full max-w-[280px] items-center justify-center gap-3 overflow-hidden rounded-full border border-white/20 bg-white/20 px-6 py-4 backdrop-blur-md transition-all hover:bg-white/30 active:scale-95">
<div class="flex h-10 w-10 items-center justify-center rounded-full bg-primary text-slate-900 shadow-[0_0_15px_rgba(25,230,94,0.6)] group-hover:shadow-[0_0_25px_rgba(25,230,94,0.8)]">
<span class="material-symbols-outlined" style="font-size: 24px;">qr_code_scanner</span>
</div>
<span class="text-lg font-bold text-white">Start Scanning</span>
</button>
</div>
</div>
</div>
<div class="mt-4 px-6 mb-8">
<div class="flex items-center justify-between mb-4">
<h2 class="text-xl font-bold text-slate-900 dark:text-slate-100">Recent Discoveries</h2>
<span class="rounded-full bg-primary/20 px-3 py-1 text-xs font-bold text-green-800 dark:text-green-300">98% Match</span>
</div>
<div class="flex space-x-4 overflow-x-auto pb-4 no-scrollbar snap-x">
<div class="snap-center relative min-w-[280px] shrink-0 overflow-hidden rounded-[2rem] bg-white dark:bg-slate-800 shadow-md">
<div class="h-48 w-full relative">
<img alt="Plate of grilled salmon with vegetables" class="h-full w-full object-cover" data-alt="Grilled salmon dish plated nicely" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCN6H_3ND6yDxjsUOUc-o4BDo3zVaQpcTQJv60cHg4K28sQCMJzbJOzVmzehuA-C3PgC5I2TcYwlYWP10KRnGtpJybISu0O9khP_hrBgoaX9_1sIdAc0rtefSoZ72xJpX3iZKJ4AiUFzN0HttF_ZY45m7gEe0crA51USd_ZGvj_x0_1OC5lCu3GMTVGBMZb6tzHZneKGVmuArgVY_hd1JnoHqZid_tZ1aCJrkVqPRn18QN6d9VBjP_13O_llOpZdnvhponxndyWOgGu"/>
<div class="absolute top-3 right-3 rounded-full bg-white/90 dark:bg-black/60 px-2 py-1 backdrop-blur-sm">
<span class="flex items-center gap-1 text-xs font-bold text-slate-900 dark:text-white">
<span class="material-symbols-outlined text-orange-500" style="font-size: 14px;">schedule</span>
                                    25 min
                                </span>
</div>
</div>
<div class="p-5">
<h3 class="text-lg font-bold leading-tight text-slate-900 dark:text-white">Honey Glazed Salmon</h3>
<p class="mt-1 text-sm text-slate-500 dark:text-slate-400">5 ingredients matched</p>
<div class="mt-4 flex items-center justify-between">
<div class="flex -space-x-2">
<img alt="Avatar" class="h-6 w-6 rounded-full border-2 border-white dark:border-slate-800" data-alt="User avatar small" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCV6HI7W9E1QaSSJtYEP3hBVd_2VC1A9kWd_KazrC49AtLehBEXK9rscTwFz93ktckXw5fMtEZbhFo7_wqf7KCSH8522M1MWFrK_pXTppWSb2pnqZK1e318IBhvSe7782YeG0JMM0ws17qBhteRXSrebb2R2ytR0VLTdbxwNpsPgttBRFowP9OQlm4tyY9vCP0RYnIz8r_IEiLHTavZW2_hWDLIB5o2oldABa4i8uGtKwzbojNq52D2P9PPnzrrMIVdpxKl1XxAdJCF"/>
<span class="flex h-6 items-center rounded-full bg-slate-100 dark:bg-slate-700 px-2 text-[10px] font-bold text-slate-500 dark:text-slate-300 pl-3">By Chef Sarah</span>
</div>
<button class="rounded-full bg-primary p-2 text-slate-900 transition hover:bg-green-400">
<span class="material-symbols-outlined block" style="font-size: 20px;">arrow_forward</span>
</button>
</div>
</div>
</div>
<div class="snap-center relative min-w-[280px] shrink-0 overflow-hidden rounded-[2rem] bg-white dark:bg-slate-800 shadow-md">
<div class="h-48 w-full relative">
<img alt="Avocado toast on a plate" class="h-full w-full object-cover" data-alt="Avocado toast with egg" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDDKDKW9KBpXgAeoDm2wd9cAz16G6YXiO5oGw_2j74f-dRZFowUsbsVpupBaffUV5cIT_oKJNbXtDsrjtlFialhLgeV7WQqGtvPEHcq_9H-3_i-QMCODCaPybyxivOVw3Uoy8eX9G2ya09C7WaZfWEwv13cDiNynx8ab-lik2kruk9FNHBG9pu5yXsITskj3HfEGnMFEWZPekbvdgyj5hHnbcGE3oxGMK4S57Yx19bu2g0xVOFzp-0eIsYYaP7I0eL_SWzP_0c94To1"/>
<div class="absolute top-3 right-3 rounded-full bg-white/90 dark:bg-black/60 px-2 py-1 backdrop-blur-sm">
<span class="flex items-center gap-1 text-xs font-bold text-slate-900 dark:text-white">
<span class="material-symbols-outlined text-orange-500" style="font-size: 14px;">schedule</span>
                                    10 min
                                </span>
</div>
</div>
<div class="p-5">
<h3 class="text-lg font-bold leading-tight text-slate-900 dark:text-white">Avocado Toast &amp; Egg</h3>
<p class="mt-1 text-sm text-slate-500 dark:text-slate-400">3 ingredients matched</p>
<div class="mt-4 flex items-center justify-between">
<div class="flex -space-x-2">
<img alt="Avatar" class="h-6 w-6 rounded-full border-2 border-white dark:border-slate-800" data-alt="User avatar small" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAheZjD0IBLoehqLbE-mRrbyTMleCg89obG-KhMEncbh9SbyK5FqT_rHZb1Jmzu0SGcxei0b7DKBce56nziFvgazYd9NqvRmggRbOk2Z6L56fxrOF_Dx2oBDn3E86ldLWn8keYAWH-2N5cW-_UH5O4mSTSnifKhGtAUFgIuNSmSNVCyABkiugDd4MOmbT7pfFx6eL_G5ju0lKW8Lh_OQ3xEQvf17NPKCpuBuP6C2y5kI5uAhxpJa5DZFRFl_SuxHD-tC68g29Uf-1at"/>
<span class="flex h-6 items-center rounded-full bg-slate-100 dark:bg-slate-700 px-2 text-[10px] font-bold text-slate-500 dark:text-slate-300 pl-3">By Mike C.</span>
</div>
<button class="rounded-full bg-slate-100 dark:bg-slate-700 p-2 text-slate-900 dark:text-white transition hover:bg-slate-200">
<span class="material-symbols-outlined block" style="font-size: 20px;">bookmark</span>
</button>
</div>
</div>
</div>
</div>
</div>
</main>
<div class="absolute bottom-0 left-0 w-full bg-white/90 dark:bg-slate-900/90 backdrop-blur-lg border-t border-slate-100 dark:border-slate-800 pb-6 pt-3 px-6 z-50">
<nav class="flex items-center justify-around">
<a class="flex flex-col items-center gap-1 text-slate-900 dark:text-white group" href="#">
<div class="relative flex h-10 w-10 items-center justify-center rounded-full bg-primary/20 text-primary transition-all group-hover:scale-110">
<span class="material-symbols-outlined fill-current" style="font-size: 24px;">home</span>
</div>
<span class="text-[10px] font-bold tracking-wide">Home</span>
</a>
<a class="flex flex-col items-center gap-1 text-slate-400 dark:text-slate-500 hover:text-slate-600 dark:hover:text-slate-300 transition-colors" href="#">
<div class="flex h-10 w-10 items-center justify-center">
<span class="material-symbols-outlined" style="font-size: 24px;">qr_code_scanner</span>
</div>
<span class="text-[10px] font-medium tracking-wide">Scan</span>
</a>
<a class="flex flex-col items-center gap-1 text-slate-400 dark:text-slate-500 hover:text-slate-600 dark:hover:text-slate-300 transition-colors" href="#">
<div class="flex h-10 w-10 items-center justify-center">
<span class="material-symbols-outlined" style="font-size: 24px;">favorite</span>
</div>
<span class="text-[10px] font-medium tracking-wide">Saved</span>
</a>
<a class="flex flex-col items-center gap-1 text-slate-400 dark:text-slate-500 hover:text-slate-600 dark:hover:text-slate-300 transition-colors" href="#">
<div class="flex h-10 w-10 items-center justify-center">
<span class="material-symbols-outlined" style="font-size: 24px;">person</span>
</div>
<span class="text-[10px] font-medium tracking-wide">Profile</span>
</a>
</nav>
</div>
</div>

</body></html>




# 6. KitchenLens - Video Recording / Photo Capturing

<!DOCTYPE html>

<html class="dark" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens Video Capture Mode</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#19e65e",
                        "background-light": "#f6f8f6",
                        "background-dark": "#080c09",
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "0.5rem",
                        "lg": "1rem",
                        "xl": "1.5rem",
                        "full": "9999px"
                    },
                },
            },
        }
    </script>
<style>
        .glass {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .progress-ring {
            transform: rotate(-90deg);
        }
        .scanner-line {
            background: linear-gradient(to bottom, transparent, #19e65e, transparent);
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-slate-100 overflow-hidden">
<div class="relative h-screen w-full max-w-md mx-auto overflow-hidden bg-black">
<!-- Camera Preview Background -->
<div class="absolute inset-0 z-0">
<img alt="Inside of a modern refrigerator with fresh vegetables and fruits" class="w-full h-full object-cover" data-alt="Interior of a fridge filled with fresh organized groceries" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDnwA49SJ9FaTV7_sUgkdAMKTj1TRwqOTGCSXfoauH-G08VVf9QY__QPm55E0ftRQehoiKGU1buZgPQ42QQgGSc_1DDosjkBEYSwNxQGdQC_If0Bo3_NCO8lvWldLHYpdrl7LM7Gx0idoZ914focYBS6D-q4DU1YXLt05acaBlZUgxWdT7lrOGvFYrFp7tHId4p9KpulVLXfZD9XLj_hx-0ij2mu4Z60FtPI1JNFfjwZAEqoKCvoADe121SylFKZCAsGy2zLfXL7MQk"/>
<!-- AI Scanning Overlay Effect -->
<div class="absolute inset-0 flex items-center justify-center pointer-events-none">
<div class="relative w-64 h-64 border-2 border-primary/30 rounded-xl">
<!-- Corner Brackets -->
<div class="absolute top-0 left-0 w-6 h-6 border-t-4 border-l-4 border-primary rounded-tl-lg"></div>
<div class="absolute top-0 right-0 w-6 h-6 border-t-4 border-r-4 border-primary rounded-tr-lg"></div>
<div class="absolute bottom-0 left-0 w-6 h-6 border-b-4 border-l-4 border-primary rounded-bl-lg"></div>
<div class="absolute bottom-0 right-0 w-6 h-6 border-b-4 border-r-4 border-primary rounded-br-lg"></div>
<!-- Scanning Line -->
<div class="absolute w-full h-1 scanner-line top-1/2 opacity-50"></div>
<!-- AI Tag Example -->
<div class="absolute top-1/4 -right-12 glass px-3 py-1 rounded-full flex items-center gap-2 border-primary/50 border">
<span class="w-2 h-2 bg-primary rounded-full"></span>
<span class="text-xs font-bold text-white tracking-wide uppercase">Bell Pepper</span>
</div>
</div>
</div>
</div>
<!-- Top Controls Overlay -->
<div class="absolute top-0 left-0 right-0 p-6 flex items-center justify-between z-10">
<button class="glass size-12 rounded-full flex items-center justify-center text-white hover:bg-white/20 transition-colors">
<span class="material-symbols-outlined">close</span>
</button>
<div class="glass px-4 py-2 rounded-full flex items-center gap-2 border border-primary/20">
<span class="w-2 h-2 bg-red-500 rounded-full animate-pulse"></span>
<span class="text-white font-bold text-lg tabular-nums">00:12</span>
</div>
<button class="glass size-12 rounded-full flex items-center justify-center text-white hover:bg-white/20 transition-colors">
<span class="material-symbols-outlined">flash_on</span>
</button>
</div>
<!-- Bottom Controls Overlay -->
<div class="absolute bottom-0 left-0 right-0 p-8 pb-12 z-10 flex flex-col items-center gap-8 bg-gradient-to-t from-black/80 to-transparent">
<!-- Mode Toggle Switch -->
<div class="glass p-1 rounded-full flex items-center w-48">
<button class="flex-1 py-2 text-sm font-semibold text-slate-400 rounded-full transition-all">
                    Photo
                </button>
<button class="flex-1 py-2 text-sm font-bold text-background-dark bg-primary rounded-full shadow-lg shadow-primary/20 transition-all">
                    Video
                </button>
</div>
<!-- Capture Row -->
<div class="w-full flex items-center justify-between px-4">
<!-- Gallery Preview -->
<button class="glass size-12 rounded-lg overflow-hidden border border-white/20">
<img alt="Previously captured food image thumbnail" class="w-full h-full object-cover opacity-80" data-alt="Small thumbnail of a kitchen counter with ingredients" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDF-6OicHWY5L60UOmxrScjO85ogxLbnGo9UfuYaraT09E4OgcEP44Ekcwpgwo5KTzLVfwVug-FMQXVfB3xjjyoRCiqjZl4cOiFJXe5WR3OSmoKkN9N76f42uQ63SKprVN7DfyWXRN6iGrC3n-DQtf7m_Z51PTbUQbjV1lDofQrn9RMatF_qKgBZVXOr3_cEpQmNYBh54eW6utsZDEQLGK7qOgZoYQMdrQcr4DSEkJ7NstyOng38UtSG7ad8GIHRaJN0vaQKdMU5dBu"/>
</button>
<!-- Main Record Button with Progress -->
<div class="relative size-24 flex items-center justify-center">
<!-- Progress Ring -->
<svg class="absolute inset-0 size-24 progress-ring" viewbox="0 0 100 100">
<circle cx="50" cy="50" fill="transparent" r="46" stroke="rgba(25, 230, 94, 0.2)" stroke-width="4"></circle>
<circle cx="50" cy="50" fill="transparent" r="46" stroke="#19e65e" stroke-dasharray="289" stroke-dashoffset="180" stroke-linecap="round" stroke-width="4"></circle>
</svg>
<!-- Inner Stop Button -->
<button class="size-16 bg-white rounded-full flex items-center justify-center hover:scale-95 transition-transform">
<div class="size-6 bg-red-600 rounded-sm"></div>
</button>
</div>
<!-- Camera Flip -->
<button class="glass size-12 rounded-full flex items-center justify-center text-white">
<span class="material-symbols-outlined">flip_camera_ios</span>
</button>
</div>
<!-- Hint Text -->
<p class="text-white/70 text-sm font-medium tracking-tight">
                Scanning for ingredients...
            </p>
</div>
<!-- Safe Area Home Indicator (iOS) -->
<div class="absolute bottom-2 left-1/2 -translate-x-1/2 w-32 h-1.5 bg-white/20 rounded-full z-20"></div>
</div>
</body></html>



# 7. KitchenLens - Processing Status

<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens Processing Status</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700;800&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#19e65e",
                        "background-light": "#f6f8f6",
                        "background-dark": "#112116",
                        "surface-light": "#ffffff",
                        "surface-dark": "#1e2d24",
                    },
                    fontFamily: {
                        "display": ["Manrope", "sans-serif"]
                    },
                    borderRadius: {"DEFAULT": "1rem", "lg": "2rem", "xl": "3rem", "full": "9999px"},
                    boxShadow: {
                        'soft': '0 4px 20px -2px rgba(0, 0, 0, 0.05)',
                        'glow': '0 0 15px rgba(25, 230, 94, 0.3)',
                    }
                },
            },
        }
    </script>
<style>
        .glass-panel {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }
        .dark .glass-panel {
            background: rgba(30, 45, 36, 0.7);
            border: 1px solid rgba(255, 255, 255, 0.05);
        }
        .animate-pulse-slow {
            animation: pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite;
        }
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: .5; }
        }
        .stripe-bg {
            background-image: repeating-linear-gradient(
                45deg,
                rgba(255, 255, 255, 0.1),
                rgba(255, 255, 255, 0.1) 10px,
                transparent 10px,
                transparent 20px
            );
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-slate-100 antialiased selection:bg-primary/30">
<div class="relative flex h-full min-h-screen w-full flex-col overflow-hidden max-w-md mx-auto shadow-2xl bg-background-light dark:bg-background-dark">
<!-- Top App Bar -->
<div class="flex items-center p-4 pt-12 pb-2 justify-between z-10">
<button class="text-slate-900 dark:text-slate-100 flex size-12 shrink-0 items-center justify-center rounded-full hover:bg-slate-100 dark:hover:bg-slate-800 transition-colors">
<span class="material-symbols-outlined">close</span>
</button>
<h2 class="text-slate-900 dark:text-slate-100 text-lg font-bold leading-tight tracking-[-0.015em] flex-1 text-center pr-12">Processing</h2>
</div>
<!-- Main Content Area -->
<div class="flex-1 flex flex-col px-6 pt-2 pb-6 gap-6 overflow-y-auto no-scrollbar">
<!-- Hero Animation Placeholder -->
<div class="relative w-full aspect-[4/3] rounded-xl overflow-hidden shadow-soft bg-surface-light dark:bg-surface-dark group">
<div class="absolute inset-0 bg-gradient-to-br from-primary/5 to-primary/20 dark:from-primary/10 dark:to-primary/5 z-0"></div>
<!-- Abstract Representation of Scanning -->
<div class="absolute inset-0 flex items-center justify-center">
<div class="w-full h-full bg-cover bg-center opacity-80 mix-blend-multiply dark:mix-blend-overlay" data-alt="Open refrigerator with fresh vegetables and ingredients inside" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuAhxDE8VujjDH7hNOJQcDI5Wowyy9P-8-0RbJJVaxwxt_DlJMZc3DLhUMXKJkExczSjH5IoVKqLsEPQT8FI2p-slT38DglJR8KlMMF19TAu9ojLjRYjpRYkYF3EG4m2fhUbZmeohIm7mCdyqk2zr3c3si5PQwPIExrqCfeNSaM7W1xZiVsWt6Fiwfotzp1XKzAqIq18Mcv-AZgSGON7AGjErE14bzVFfUr7RHrrjv11SMoEiuooYkwOWeo0PG-jk33tCcZ0RGvdAucw')"></div>
<!-- Scanning Line Animation Effect -->
<div class="absolute top-0 left-0 w-full h-1 bg-primary shadow-[0_0_20px_rgba(25,230,94,0.8)] animate-[scan_2.5s_ease-in-out_infinite]"></div>
<style>
                        @keyframes scan {
                            0% { top: 0%; opacity: 0; }
                            10% { opacity: 1; }
                            90% { opacity: 1; }
                            100% { top: 100%; opacity: 0; }
                        }
                    </style>
</div>
<div class="absolute bottom-4 right-4 bg-white/90 dark:bg-black/60 backdrop-blur-sm px-3 py-1 rounded-full text-xs font-bold text-primary border border-primary/20 shadow-sm flex items-center gap-1">
<span class="material-symbols-outlined text-[16px] animate-spin">sync</span>
                    Scanning
                </div>
</div>
<!-- Progress Percentage & Bar -->
<div class="flex flex-col gap-3 mt-2">
<div class="flex items-end justify-between px-1">
<div class="flex flex-col">
<span class="text-sm font-medium text-slate-500 dark:text-slate-400">Total Progress</span>
<h1 class="text-5xl font-extrabold text-primary tracking-tight">72%</h1>
</div>
<div class="flex flex-col items-end pb-2">
<span class="text-xs font-semibold text-primary bg-primary/10 px-2 py-1 rounded-lg">Est. 10s left</span>
</div>
</div>
<!-- Chunked Progress Bar -->
<div class="h-4 w-full bg-slate-200 dark:bg-slate-700 rounded-full overflow-hidden p-[2px]">
<div class="h-full bg-primary rounded-full relative overflow-hidden stripe-bg transition-all duration-500 ease-out" style="width: 72%;"></div>
</div>
</div>
<!-- Vertical Stepper -->
<div class="flex flex-col gap-4 mt-2">
<!-- Step 1: Completed -->
<div class="glass-panel p-4 rounded-xl flex items-center gap-4 shadow-sm border-l-4 border-l-primary transition-all">
<div class="relative flex items-center justify-center size-8 rounded-full bg-primary text-white shrink-0 shadow-glow">
<span class="material-symbols-outlined text-lg font-bold">check</span>
</div>
<div class="flex flex-col">
<span class="text-slate-900 dark:text-slate-100 font-bold text-base leading-tight">Uploading</span>
<span class="text-slate-500 dark:text-slate-400 text-xs">Image successfully uploaded</span>
</div>
</div>
<!-- Step 2: Active -->
<div class="glass-panel p-4 rounded-xl flex items-center gap-4 shadow-md border-l-4 border-l-primary relative overflow-hidden">
<!-- Active Glow Background -->
<div class="absolute inset-0 bg-primary/5 dark:bg-primary/10 animate-pulse-slow"></div>
<div class="relative flex items-center justify-center size-8 rounded-full border-2 border-primary bg-white dark:bg-slate-800 text-primary shrink-0 z-10 shadow-glow">
<span class="material-symbols-outlined text-lg animate-spin">progress_activity</span>
</div>
<div class="flex flex-col z-10">
<span class="text-slate-900 dark:text-slate-100 font-bold text-base leading-tight">Analyzing ingredients...</span>
<span class="text-primary text-xs font-medium">Identifying vegetables &amp; proteins</span>
</div>
</div>
<!-- Step 3: Pending -->
<div class="p-4 rounded-xl flex items-center gap-4 border border-slate-100 dark:border-slate-800 bg-slate-50/50 dark:bg-slate-800/30 opacity-60">
<div class="relative flex items-center justify-center size-8 rounded-full border-2 border-slate-300 dark:border-slate-600 bg-transparent text-slate-300 dark:text-slate-600 shrink-0">
<span class="text-xs font-bold">3</span>
</div>
<div class="flex flex-col">
<span class="text-slate-500 dark:text-slate-400 font-medium text-base leading-tight">Generating Recipes</span>
<span class="text-slate-400 dark:text-slate-500 text-xs">Waiting for analysis</span>
</div>
</div>
</div>
</div>
<!-- Bottom Action -->
<div class="flex flex-col items-center justify-center p-6 bg-gradient-to-t from-background-light via-background-light to-transparent dark:from-background-dark dark:via-background-dark pt-0">
<button class="group flex w-auto min-w-[120px] cursor-pointer items-center justify-center gap-2 overflow-hidden rounded-full h-12 px-6 bg-slate-200 dark:bg-slate-800 text-slate-700 dark:text-slate-300 text-sm font-bold leading-normal tracking-wide hover:bg-slate-300 dark:hover:bg-slate-700 transition-all active:scale-95">
<span class="material-symbols-outlined text-[18px]">visibility_off</span>
<span>Hide</span>
</button>
<p class="text-slate-400 dark:text-slate-500 text-xs mt-4 text-center">We'll notify you when your recipes are ready.</p>
</div>
</div>
</body></html>



# 8. KitchenLens - Scan Results page

<!DOCTYPE html>
<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens AI Scan Results</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@200..800&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#19e65e",
                        "primary-dark": "#15c24e",
                        "background-light": "#f6f8f6",
                        "background-dark": "#112116",
                        "surface-light": "#ffffff",
                        "surface-dark": "#1e2e24",
                    },
                    fontFamily: {
                        "display": ["Plus Jakarta Sans", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "1rem",
                        "lg": "1.5rem",
                        "xl": "2rem",
                        "2xl": "2.5rem",
                        "full": "9999px"
                    },
                },
            },
        }
    </script>
<style>
        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }
        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
        .glass-panel {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        .dark .glass-panel {
            background: rgba(30, 46, 36, 0.7);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .glass-badge {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-slate-100 antialiased selection:bg-primary/30">
<div class="relative mx-auto flex h-full min-h-screen w-full max-w-md flex-col overflow-hidden bg-background-light dark:bg-background-dark shadow-2xl">
<header class="flex items-center justify-between px-6 pt-12 pb-4 z-20 relative">
<button class="flex h-10 w-10 items-center justify-center rounded-full bg-surface-light dark:bg-surface-dark shadow-sm transition-transform hover:scale-105 border border-slate-100 dark:border-slate-800">
<span class="material-symbols-outlined text-slate-900 dark:text-white" style="font-size: 20px;">arrow_back</span>
</button>
<h1 class="text-lg font-bold text-slate-900 dark:text-white">Scan Results</h1>
<button class="flex h-10 w-10 items-center justify-center rounded-full bg-surface-light dark:bg-surface-dark shadow-sm transition-transform hover:scale-105 border border-slate-100 dark:border-slate-800">
<span class="material-symbols-outlined text-slate-900 dark:text-white" style="font-size: 20px;">more_horiz</span>
</button>
</header>
<main class="flex-1 overflow-y-auto pb-24 no-scrollbar">
<div class="px-6 mb-8">
<div class="flex items-center gap-2 mb-4">
<div class="flex h-8 w-8 items-center justify-center rounded-full bg-green-100 text-green-600">
<span class="material-symbols-outlined" style="font-size: 18px;">check</span>
</div>
<h2 class="text-xl font-bold text-slate-900 dark:text-slate-100">Found 5 Ingredients</h2>
</div>
<div class="flex space-x-3 overflow-x-auto pb-2 no-scrollbar">
<div class="shrink-0 flex flex-col items-center gap-2">
<div class="h-16 w-16 rounded-2xl bg-orange-50 dark:bg-orange-900/20 border border-orange-100 dark:border-orange-900/50 flex items-center justify-center p-2 shadow-sm">
<span class="text-3xl">🐟</span>
</div>
<span class="text-xs font-semibold text-slate-600 dark:text-slate-400">Salmon</span>
</div>
<div class="shrink-0 flex flex-col items-center gap-2">
<div class="h-16 w-16 rounded-2xl bg-green-50 dark:bg-green-900/20 border border-green-100 dark:border-green-900/50 flex items-center justify-center p-2 shadow-sm">
<span class="text-3xl">🥦</span>
</div>
<span class="text-xs font-semibold text-slate-600 dark:text-slate-400">Broccoli</span>
</div>
<div class="shrink-0 flex flex-col items-center gap-2">
<div class="h-16 w-16 rounded-2xl bg-yellow-50 dark:bg-yellow-900/20 border border-yellow-100 dark:border-yellow-900/50 flex items-center justify-center p-2 shadow-sm">
<span class="text-3xl">🍋</span>
</div>
<span class="text-xs font-semibold text-slate-600 dark:text-slate-400">Lemon</span>
</div>
<div class="shrink-0 flex flex-col items-center gap-2">
<div class="h-16 w-16 rounded-2xl bg-red-50 dark:bg-red-900/20 border border-red-100 dark:border-red-900/50 flex items-center justify-center p-2 shadow-sm">
<span class="text-3xl">🧄</span>
</div>
<span class="text-xs font-semibold text-slate-600 dark:text-slate-400">Garlic</span>
</div>
<div class="shrink-0 flex flex-col items-center gap-2">
<div class="h-16 w-16 rounded-2xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 flex items-center justify-center p-2 shadow-sm">
<span class="text-3xl">🧈</span>
</div>
<span class="text-xs font-semibold text-slate-600 dark:text-slate-400">Butter</span>
</div>
</div>
</div>
<div class="px-4 mb-8">
<div class="flex items-center justify-between mb-4 px-2">
<h2 class="text-xl font-bold text-slate-900 dark:text-slate-100">Top Match</h2>
<span class="text-sm font-medium text-primary">Based on ingredients</span>
</div>
<div class="relative w-full overflow-hidden rounded-[2.5rem] shadow-xl group">
<div class="relative aspect-[4/5] w-full">
<img alt="Pan seared salmon with broccoli and lemon" class="h-full w-full object-cover transition-transform duration-700 group-hover:scale-105" data-alt="High quality food photo of salmon" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCN6H_3ND6yDxjsUOUc-o4BDo3zVaQpcTQJv60cHg4K28sQCMJzbJOzVmzehuA-C3PgC5I2TcYwlYWP10KRnGtpJybISu0O9khP_hrBgoaX9_1sIdAc0rtefSoZ72xJpX3iZKJ4AiUFzN0HttF_ZY45m7gEe0crA51USd_ZGvj_x0_1OC5lCu3GMTVGBMZb6tzHZneKGVmuArgVY_hd1JnoHqZid_tZ1aCJrkVqPRn18QN6d9VBjP_13O_llOpZdnvhponxndyWOgGu"/>
<div class="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-black/10"></div>
<div class="absolute top-6 left-6 right-6 flex justify-between items-start">
<div class="glass-badge rounded-full px-4 py-2 flex items-center gap-1.5">
<span class="block h-2 w-2 rounded-full bg-primary animate-pulse"></span>
<span class="text-sm font-bold text-white tracking-wide">98% Match</span>
</div>
<button class="h-10 w-10 rounded-full glass-badge flex items-center justify-center text-white hover:bg-white/20 transition-colors">
<span class="material-symbols-outlined fill-current" style="font-size: 20px;">favorite</span>
</button>
</div>
<div class="absolute bottom-0 left-0 w-full p-6">
<div class="glass-panel rounded-3xl p-5 text-slate-900 dark:text-white">
<h3 class="text-2xl font-bold leading-tight mb-2 text-slate-900 dark:text-white">Lemon Butter Pan-Seared Salmon</h3>
<div class="flex items-center gap-4 mb-5 text-sm font-medium text-slate-600 dark:text-slate-300">
<div class="flex items-center gap-1">
<span class="material-symbols-outlined" style="font-size: 18px;">schedule</span>
                                        25 min
                                    </div>
<div class="h-1 w-1 rounded-full bg-slate-400"></div>
<div class="flex items-center gap-1">
<span class="material-symbols-outlined" style="font-size: 18px;">bar_chart</span>
                                        Easy
                                    </div>
<div class="h-1 w-1 rounded-full bg-slate-400"></div>
<div class="flex items-center gap-1">
<span class="material-symbols-outlined" style="font-size: 18px;">local_fire_department</span>
                                        450 kcal
                                    </div>
</div>
<button class="w-full rounded-2xl bg-primary hover:bg-primary-dark text-slate-900 py-3.5 px-4 font-bold text-lg shadow-lg shadow-green-500/20 transition-all active:scale-[0.98] flex items-center justify-center gap-2">
<span class="material-symbols-outlined">skillet</span>
                                    Cook This
                                </button>
</div>
</div>
</div>
</div>
</div>
<div class="px-6 pb-6">
<div class="flex items-center justify-between mb-4">
<h2 class="text-xl font-bold text-slate-900 dark:text-slate-100">Other Suggestions</h2>
<a class="text-sm font-semibold text-slate-500 dark:text-slate-400" href="#">View All</a>
</div>
<div class="grid grid-cols-2 gap-4">
<div class="flex flex-col gap-3 group cursor-pointer">
<div class="relative aspect-square w-full overflow-hidden rounded-3xl bg-surface-light dark:bg-surface-dark shadow-sm">
<img alt="Lemon Butter Pasta" class="h-full w-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="Pasta dish with lemon" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDDKDKW9KBpXgAeoDm2wd9cAz16G6YXiO5oGw_2j74f-dRZFowUsbsVpupBaffUV5cIT_oKJNbXtDsrjtlFialhLgeV7WQqGtvPEHcq_9H-3_i-QMCODCaPybyxivOVw3Uoy8eX9G2ya09C7WaZfWEwv13cDiNynx8ab-lik2kruk9FNHBG9pu5yXsITskj3HfEGnMFEWZPekbvdgyj5hHnbcGE3oxGMK4S57Yx19bu2g0xVOFzp-0eIsYYaP7I0eL_SWzP_0c94To1"/>
<div class="absolute top-3 right-3 glass-badge rounded-full px-2 py-1">
<span class="text-xs font-bold text-white">85% Match</span>
</div>
</div>
<div>
<h4 class="text-base font-bold text-slate-900 dark:text-white leading-tight mb-1">Lemon Butter Pasta</h4>
<p class="text-xs font-medium text-slate-500 dark:text-slate-400">15 min • Intermediate</p>
</div>
</div>
<div class="flex flex-col gap-3 group cursor-pointer">
<div class="relative aspect-square w-full overflow-hidden rounded-3xl bg-surface-light dark:bg-surface-dark shadow-sm">
<img alt="Pan-Seared Veggies" class="h-full w-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="Mixed vegetables in a pan" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDUw-h7mB6Z2GyEJEcme-BEmYU7mtfb4mNF98fYpXGTaur22GI31vwTbZHrxbMxwrx-I5tJAnZEycKsG9smo183xHFld8_DVvwffkRPMsbHYMDdC5Eugmrrng6JIAwwz6hQpoh9cWtMquSDFc6Jf4nb5IEN6GdFI2tc7A3a3yL-J2ovW-wOyMvKKJzehhBuHsyKo2r1SKJ4-9dj3rxg-dl_zWcC60PKtNiAPh0Ct7vj1XWRbUrcJGzObjM43XgYiOShZVDXfFBEEyIk"/>
<div class="absolute top-3 right-3 glass-badge rounded-full px-2 py-1">
<span class="text-xs font-bold text-white">72% Match</span>
</div>
</div>
<div>
<h4 class="text-base font-bold text-slate-900 dark:text-white leading-tight mb-1">Pan-Seared Veggies</h4>
<p class="text-xs font-medium text-slate-500 dark:text-slate-400">20 min • Easy</p>
</div>
</div>
</div>
</div>
</main>
<div class="absolute bottom-0 left-0 w-full bg-white/90 dark:bg-slate-900/90 backdrop-blur-lg border-t border-slate-100 dark:border-slate-800 pb-6 pt-3 px-6 z-50">
<nav class="flex items-center justify-around">
<a class="flex flex-col items-center gap-1 text-slate-400 dark:text-slate-500 hover:text-slate-600 dark:hover:text-slate-300 transition-colors" href="#">
<div class="flex h-10 w-10 items-center justify-center">
<span class="material-symbols-outlined" style="font-size: 24px;">home</span>
</div>
<span class="text-[10px] font-medium tracking-wide">Home</span>
</a>
<a class="flex flex-col items-center gap-1 text-slate-900 dark:text-white group" href="#">
<div class="relative flex h-10 w-10 items-center justify-center rounded-full bg-primary/20 text-primary transition-all group-hover:scale-110">
<span class="material-symbols-outlined fill-current" style="font-size: 24px;">qr_code_scanner</span>
</div>
<span class="text-[10px] font-bold tracking-wide">Scan</span>
</a>
<a class="flex flex-col items-center gap-1 text-slate-400 dark:text-slate-500 hover:text-slate-600 dark:hover:text-slate-300 transition-colors" href="#">
<div class="flex h-10 w-10 items-center justify-center">
<span class="material-symbols-outlined" style="font-size: 24px;">favorite</span>
</div>
<span class="text-[10px] font-medium tracking-wide">Saved</span>
</a>
<a class="flex flex-col items-center gap-1 text-slate-400 dark:text-slate-500 hover:text-slate-600 dark:hover:text-slate-300 transition-colors" href="#">
<div class="flex h-10 w-10 items-center justify-center">
<span class="material-symbols-outlined" style="font-size: 24px;">person</span>
</div>
<span class="text-[10px] font-medium tracking-wide">Profile</span>
</a>
</nav>
</div>
</div>

</body></html>




# 9. KitchenLens - Recipe Detail Page

<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens - Recipe Detail</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#19e65e",
                        "background-light": "#f6f8f6",
                        "background-dark": "#112116",
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "0.5rem",
                        "lg": "1rem",
                        "xl": "1.5rem",
                        "full": "9999px"
                    },
                },
            },
        }
    </script>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-slate-100 antialiased">
<!-- Main Container -->
<div class="relative mx-auto max-w-md min-h-screen bg-white dark:bg-slate-950 shadow-2xl overflow-x-hidden pb-32">
<!-- Hero Header -->
<div class="relative h-80 w-full overflow-hidden">
<div class="absolute inset-0 bg-cover bg-center" data-alt="Gourmet pan-seared salmon with fresh green asparagus" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuCkWBFOmsAqRA2_9ew0w13UBFdp8AFb9M5dDBRlYkmm1y-67QowIsWU6TtYTFFzkQlsbnrkjtBCjijT69FRCXh8isVzlJFFgkfR93QvOitx0ViMwKraqeAT25CWPITFfjWk8HJcfWQx39jCypAubzZww8LndeLnPoqgyGs_fSddk9Mb0V8ZrqfI5q_S_nzOWS8aVJSZZc9BwogZ7YK0wqKp_umtmJiWU0-dUWPzsuIv6cvJu-18hb4GhM2P_DnEXY2fj6z5Gg0BUPfQ");'></div>
<div class="absolute inset-0 bg-gradient-to-b from-black/30 via-transparent to-transparent"></div>
<!-- Top Navigation Overlay -->
<div class="absolute top-0 left-0 right-0 flex items-center justify-between p-4 pt-12">
<button class="flex h-10 w-10 items-center justify-center rounded-full bg-white/20 backdrop-blur-md text-white border border-white/30">
<span class="material-symbols-outlined">arrow_back_ios_new</span>
</button>
<button class="flex h-10 w-10 items-center justify-center rounded-full bg-white/20 backdrop-blur-md text-white border border-white/30">
<span class="material-symbols-outlined">favorite</span>
</button>
</div>
</div>
<!-- Recipe Content -->
<div class="relative -mt-6 rounded-t-xl bg-white dark:bg-slate-950 px-5 pt-6">
<!-- Title & Tags -->
<div class="mb-6">
<h1 class="text-3xl font-bold tracking-tight text-slate-900 dark:text-slate-50 mb-3">Pan-Seared Salmon with Asparagus</h1>
<div class="flex gap-2 overflow-x-auto pb-2 no-scrollbar">
<span class="inline-flex items-center rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">Keto</span>
<span class="inline-flex items-center rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">Gluten-Free</span>
<span class="inline-flex items-center rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">High Protein</span>
</div>
</div>
<!-- Quick Stats Grid -->
<div class="grid grid-cols-4 gap-2 mb-8">
<div class="flex flex-col items-center justify-center rounded-xl border border-slate-100 dark:border-slate-800 p-3 bg-slate-50/50 dark:bg-slate-900/50">
<span class="material-symbols-outlined text-primary mb-1">group</span>
<span class="text-xs text-slate-500 dark:text-slate-400">Servings</span>
<span class="text-sm font-bold">2</span>
</div>
<div class="flex flex-col items-center justify-center rounded-xl border border-slate-100 dark:border-slate-800 p-3 bg-slate-50/50 dark:bg-slate-900/50">
<span class="material-symbols-outlined text-primary mb-1">timer</span>
<span class="text-xs text-slate-500 dark:text-slate-400">Prep</span>
<span class="text-sm font-bold">10m</span>
</div>
<div class="flex flex-col items-center justify-center rounded-xl border border-slate-100 dark:border-slate-800 p-3 bg-slate-50/50 dark:bg-slate-900/50">
<span class="material-symbols-outlined text-primary mb-1">cooking</span>
<span class="text-xs text-slate-500 dark:text-slate-400">Cook</span>
<span class="text-sm font-bold">15m</span>
</div>
<div class="flex flex-col items-center justify-center rounded-xl border border-slate-100 dark:border-slate-800 p-3 bg-slate-50/50 dark:bg-slate-900/50">
<span class="material-symbols-outlined text-primary mb-1">bar_chart</span>
<span class="text-xs text-slate-500 dark:text-slate-400">Easy</span>
<span class="text-sm font-bold">Level</span>
</div>
</div>
<!-- Ingredients Section -->
<div class="mb-8">
<div class="flex items-center justify-between mb-4">
<h2 class="text-xl font-bold text-slate-900 dark:text-slate-50">Ingredients</h2>
<span class="text-sm text-slate-500">6 items</span>
</div>
<ul class="space-y-3">
<li class="flex items-center justify-between p-3 rounded-lg bg-slate-50 dark:bg-slate-900/50">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined text-primary text-xl">check_circle</span>
<span class="text-sm font-medium">Fresh Salmon Fillets</span>
</div>
<span class="text-sm font-bold text-slate-500">2 pcs (400g)</span>
</li>
<li class="flex items-center justify-between p-3 rounded-lg bg-slate-50 dark:bg-slate-900/50">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined text-primary text-xl">check_circle</span>
<span class="text-sm font-medium">Green Asparagus</span>
</div>
<span class="text-sm font-bold text-slate-500">1 bunch</span>
</li>
<li class="flex items-center justify-between p-3 rounded-lg bg-slate-50 dark:bg-slate-900/50">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined text-primary text-xl">check_circle</span>
<span class="text-sm font-medium">Extra Virgin Olive Oil</span>
</div>
<span class="text-sm font-bold text-slate-500">2 tbsp</span>
</li>
<li class="flex items-center justify-between p-3 rounded-lg bg-slate-50 dark:bg-slate-900/50">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined text-primary text-xl">check_circle</span>
<span class="text-sm font-medium">Fresh Lemon</span>
</div>
<span class="text-sm font-bold text-slate-500">1/2 unit</span>
</li>
</ul>
</div>
<!-- Instructions Section -->
<div class="mb-8">
<h2 class="text-xl font-bold text-slate-900 dark:text-slate-50 mb-4">Instructions</h2>
<div class="space-y-6">
<div class="flex gap-4">
<div class="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-primary text-white text-sm font-bold">1</div>
<p class="text-sm leading-relaxed text-slate-600 dark:text-slate-300 pt-1">Season salmon fillets generously with salt and pepper. Pat the skin dry with a paper towel for extra crispiness.</p>
</div>
<div class="flex gap-4">
<div class="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-primary text-white text-sm font-bold">2</div>
<p class="text-sm leading-relaxed text-slate-600 dark:text-slate-300 pt-1">Heat olive oil in a large skillet over medium-high heat. Place salmon skin-side down and cook for 4-5 minutes until crispy.</p>
</div>
<div class="flex gap-4">
<div class="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-primary text-white text-sm font-bold">3</div>
<p class="text-sm leading-relaxed text-slate-600 dark:text-slate-300 pt-1">Flip the salmon and add asparagus to the pan. Sauté for another 4 minutes until the salmon is cooked through and asparagus is tender.</p>
</div>
</div>
</div>
<!-- AI & Nutrition Accordions -->
<div class="space-y-3 mb-10">
<!-- AI Reasoning -->
<div class="rounded-xl border border-primary/20 bg-primary/5 p-4">
<button class="flex w-full items-center justify-between text-left">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined text-primary">temp_preferences_custom</span>
<span class="font-bold text-slate-900 dark:text-slate-50">AI Chef's Reasoning</span>
</div>
<span class="material-symbols-outlined text-slate-400">expand_more</span>
</button>
<div class="mt-3 text-sm text-slate-600 dark:text-slate-400 leading-relaxed">
                        I noticed you have fresh salmon and a bunch of asparagus in your fridge that need to be used within 24 hours. This recipe perfectly utilizes those ingredients while keeping your meal under 500 calories as per your health goals.
                    </div>
</div>
<!-- Nutrition Estimate -->
<div class="rounded-xl border border-slate-100 dark:border-slate-800 bg-slate-50/50 dark:bg-slate-900/50 p-4">
<button class="flex w-full items-center justify-between text-left">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined text-slate-500">nutrition</span>
<span class="font-bold text-slate-900 dark:text-slate-50">Nutrition Estimate</span>
</div>
<span class="material-symbols-outlined text-slate-400">expand_more</span>
</button>
<div class="mt-4 grid grid-cols-3 gap-2">
<div class="text-center">
<p class="text-xs text-slate-500">Calories</p>
<p class="text-sm font-bold">385 kcal</p>
</div>
<div class="text-center">
<p class="text-xs text-slate-500">Protein</p>
<p class="text-sm font-bold">42g</p>
</div>
<div class="text-center">
<p class="text-xs text-slate-500">Carbs</p>
<p class="text-sm font-bold">6g</p>
</div>
</div>
</div>
</div>
</div>
<!-- Sticky Primary Action -->
<div class="fixed bottom-0 left-0 right-0 mx-auto max-w-md p-6 bg-gradient-to-t from-white via-white/95 to-transparent dark:from-slate-950 dark:via-slate-950/95">
<button class="w-full flex items-center justify-center gap-2 rounded-xl bg-primary py-4 px-6 text-slate-950 font-bold text-lg shadow-lg shadow-primary/20 active:scale-95 transition-transform">
<span class="material-symbols-outlined">play_circle</span>
                Start Cooking
            </button>
</div>
</div>
<style>
        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }
        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
    </style>
</body></html>




# 10. KitchenLens Professional Cook Mode

import React from 'react';
import {
  View,
  Text,
  Image,
  StyleSheet,
  TouchableOpacity,
  SafeAreaView,
  StatusBar,
} from 'react-native';
import {
  ChevronLeft,
  ChevronRight,
  X,
  Mic,
  Timer,
  Lightbulb,
} from 'lucide-react-native';

/**
 * KitchenLens Professional Cook Mode - Light Version
 * Optimized for high-readability in a kitchen environment.
 */
const CookModeScreen = () => {
  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="dark-content" />

      {/* Header Navigation */}
      <View style={styles.header}>
        <TouchableOpacity style={styles.iconButton}>
          <X size={24} color="#1A1C1E" />
        </TouchableOpacity>
        <Text style={styles.stepText}>STEP 3 OF 8</Text>
        <TouchableOpacity style={styles.exitButton}>
          <Text style={styles.exitText}>Exit</Text>
        </TouchableOpacity>
      </View>

      {/* Progress Bar */}
      <View style={styles.progressTrack}>
        <View style={[styles.progressFill, { width: '37.5%' }]} />
      </View>

      {/* Content Area */}
      <View style={styles.content}>
        {/* Main Step Image */}
        <View style={styles.imageContainer}>
          <Image
            source={{
              uri: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&q=80&w=800',
            }}
            style={styles.heroImage}
            resizeMode="cover"
          />
          <View style={styles.cookingBadge}>
            <View style={styles.badgeDot} />
            <Text style={styles.badgeText}>COOKING</Text>
          </View>
        </View>

        {/* Step Instructions */}
        <View style={styles.instructionContainer}>
          <Text style={styles.stepTitle}>
            <Text style={styles.stepNumber}>3. </Text>
            Sear the Salmon
          </Text>
          <Text style={styles.description}>
            Evenly sear the salmon fillets for <Text style={styles.highlight}>4 minutes</Text> until{' '}
            <Text style={styles.highlight}>golden brown</Text>.
          </Text>
        </View>

        {/* Suggested Timer Card */}
        <View style={[styles.card, styles.shadow]}>
          <View style={styles.timerIconContainer}>
            <Timer size={24} color="#00D261" />
          </View>
          <View style={styles.cardContent}>
            <Text style={styles.cardLabel}>SUGGESTED TIMER</Text>
            <Text style={styles.cardValue}>04:00</Text>
          </View>
          <TouchableOpacity style={styles.startButton}>
            <Text style={styles.startButtonText}>Start</Text>
          </TouchableOpacity>
        </View>

        {/* Tip Card */}
        <View style={[styles.tipCard, styles.shadow]}>
          <View style={styles.tipIconContainer}>
            <Lightbulb size={20} color="#6C757D" />
          </View>
          <Text style={styles.tipText}>
            Don't move the fish once it's in the pan. Let the crust form naturally for easier
            flipping.
          </Text>
        </View>
      </View>

      {/* Footer Navigation Controls */}
      <View style={styles.footer}>
        <TouchableOpacity style={styles.navButtonSecondary}>
          <Text style={styles.navButtonSecondaryText}>Previous</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.voiceButton}>
          <Mic size={24} color="#00D261" />
        </TouchableOpacity>

        <TouchableOpacity style={styles.navButtonPrimary}>
          <Text style={styles.navButtonPrimaryText}>Next</Text>
          <ChevronRight size={20} color="#FFFFFF" style={{ marginLeft: 4 }} />
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F8F9FA',
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 20,
    paddingVertical: 12,
  },
  iconButton: {
    padding: 8,
  },
  stepText: {
    fontSize: 14,
    fontWeight: '600',
    color: '#6C757D',
    letterSpacing: 0.5,
  },
  exitButton: {
    backgroundColor: '#E9ECEF',
    paddingHorizontal: 16,
    paddingVertical: 8,
    borderRadius: 20,
  },
  exitText: {
    fontSize: 14,
    fontWeight: '600',
    color: '#1A1C1E',
  },
  progressTrack: {
    height: 4,
    backgroundColor: '#E9ECEF',
    marginHorizontal: 20,
    borderRadius: 2,
    overflow: 'hidden',
  },
  progressFill: {
    height: '100%',
    backgroundColor: '#00D261',
  },
  content: {
    flex: 1,
    padding: 20,
  },
  imageContainer: {
    width: '100%',
    height: 240,
    borderRadius: 24,
    overflow: 'hidden',
    marginBottom: 24,
  },
  heroImage: {
    width: '100%',
    height: '100%',
  },
  cookingBadge: {
    position: 'absolute',
    top: 16,
    right: 16,
    backgroundColor: '#E7F9F0',
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 12,
  },
  badgeDot: {
    width: 8,
    height: 8,
    borderRadius: 4,
    backgroundColor: '#00D261',
    marginRight: 6,
  },
  badgeText: {
    fontSize: 12,
    fontWeight: '700',
    color: '#1A3F2A',
    letterSpacing: 0.5,
  },
  instructionContainer: {
    marginBottom: 24,
  },
  stepTitle: {
    fontSize: 28,
    fontWeight: '800',
    color: '#1A1C1E',
    marginBottom: 8,
  },
  stepNumber: {
    color: '#1A3F2A',
  },
  description: {
    fontSize: 18,
    lineHeight: 28,
    color: '#495057',
  },
  highlight: {
    fontWeight: '700',
    color: '#1A3F2A',
  },
  card: {
    backgroundColor: '#FFFFFF',
    borderRadius: 40,
    padding: 12,
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 16,
  },
  tipCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 40,
    padding: 16,
    paddingRight: 24,
    flexDirection: 'row',
    alignItems: 'flex-start',
  },
  cardContent: {
    flex: 1,
    marginLeft: 12,
  },
  cardLabel: {
    fontSize: 11,
    fontWeight: '700',
    color: '#6C757D',
    letterSpacing: 1,
  },
  cardValue: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1A1C1E',
  },
  timerIconContainer: {
    width: 48,
    height: 48,
    borderRadius: 24,
    backgroundColor: '#E7F9F0',
    justifyContent: 'center',
    alignItems: 'center',
  },
  startButton: {
    backgroundColor: '#00D261',
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 24,
  },
  startButtonText: {
    fontSize: 16,
    fontWeight: '700',
    color: '#FFFFFF',
  },
  tipIconContainer: {
    width: 32,
    height: 32,
    borderRadius: 16,
    backgroundColor: '#F8F9FA',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  tipText: {
    flex: 1,
    fontSize: 14,
    lineHeight: 22,
    color: '#6C757D',
    paddingTop: 4,
  },
  shadow: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.05,
    shadowRadius: 10,
    elevation: 4,
  },
  footer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 20,
    paddingBottom: 20,
    paddingTop: 12,
  },
  navButtonSecondary: {
    backgroundColor: '#F8F9FA',
    paddingHorizontal: 24,
    paddingVertical: 16,
    borderRadius: 30,
    borderWidth: 1,
    borderColor: '#E9ECEF',
    flex: 0.4,
    alignItems: 'center',
  },
  navButtonSecondaryText: {
    fontSize: 16,
    fontWeight: '700',
    color: '#1A1C1E',
  },
  voiceButton: {
    width: 56,
    height: 56,
    borderRadius: 28,
    backgroundColor: '#F8F9FA',
    justifyContent: 'center',
    alignItems: 'center',
    borderWidth: 1,
    borderColor: '#E9ECEF',
  },
  navButtonPrimary: {
    backgroundColor: '#00D261',
    paddingHorizontal: 24,
    paddingVertical: 16,
    borderRadius: 30,
    flex: 0.4,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
  },
  navButtonPrimaryText: {
    fontSize: 16,
    fontWeight: '700',
    color: '#FFFFFF',
  },
});

export default CookModeScreen;




# 11. KitchenLens - User Profile

<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens User Profile</title>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#19e65e",
                        "background-light": "#f6f8f6",
                        "background-dark": "#112116",
                        "text-main": "#111813",
                        "text-secondary": "#63886f",
                    },
                    fontFamily: {
                        "display": ["Manrope", "sans-serif"]
                    },
                    borderRadius: {"DEFAULT": "1rem", "lg": "2rem", "xl": "3rem", "full": "9999px"},
                },
            },
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .material-symbols-outlined.filled {
            font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-slate-100 antialiased selection:bg-primary/30">
<div class="relative flex h-full min-h-screen w-full flex-col mx-auto max-w-md bg-white dark:bg-neutral-900 shadow-2xl overflow-hidden">
<!-- Header / Profile Section -->
<div class="relative flex flex-col items-center pt-12 pb-8 px-6">
<!-- Subtle organic blob for background accent -->
<div class="absolute top-[-50%] left-1/2 -translate-x-1/2 w-[150%] aspect-square rounded-full bg-gradient-to-b from-primary/10 to-transparent blur-3xl pointer-events-none"></div>
<div class="relative z-10 group cursor-pointer">
<div class="relative p-1 rounded-full border-2 border-primary/20">
<div class="h-28 w-28 rounded-full bg-slate-200 bg-cover bg-center shadow-sm" data-alt="Portrait of a smiling young woman with dark hair" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBZhIe-GFXEXR1BUk2-Z43tMz17vPruNVMacfFmjLFT8c-y-hVHr3WqisKY5jnFanY_YVFhgcgncdNBaOI32_emOfv7Yd6qEicUBnc0eTlR7TjySvc0JEr5vUh9OAAnA31O87uAKs0wLuojviAwMrFxrhsC44KQzWemSobO1wqPv2_KBoP4IdOYqHtHRIInCa4FkxiT6aUi_XLpYgkERlAdM0Dn4NhManVdwBWkNzBPlhiJTxeVu_-OuJJELCfqEBMZlOVgCWFxbGu3');"></div>
<div class="absolute bottom-1 right-1 bg-primary text-white p-1.5 rounded-full border-2 border-white dark:border-neutral-900 shadow-sm flex items-center justify-center">
<span class="material-symbols-outlined text-[16px]">edit</span>
</div>
</div>
</div>
<h1 class="mt-4 text-2xl font-bold text-slate-900 dark:text-white tracking-tight">Sophia Chen</h1>
<p class="text-slate-500 dark:text-slate-400 font-medium text-sm">sophia.c@kitchenlens.com</p>
</div>
<!-- Stats Grid -->
<div class="px-4 pb-6 w-full">
<div class="grid grid-cols-3 gap-3">
<!-- Stat Card 1 -->
<div class="flex flex-col items-center justify-center p-4 bg-slate-50 dark:bg-neutral-800 rounded-xl border border-slate-100 dark:border-neutral-700 shadow-sm">
<div class="bg-primary/10 p-2 rounded-full mb-2">
<span class="material-symbols-outlined text-primary text-[20px]">skillet</span>
</div>
<span class="text-2xl font-bold text-slate-900 dark:text-white">42</span>
<span class="text-[11px] font-semibold uppercase tracking-wide text-slate-400 dark:text-slate-500 text-center">Recipes Cooked</span>
</div>
<!-- Stat Card 2 -->
<div class="flex flex-col items-center justify-center p-4 bg-slate-50 dark:bg-neutral-800 rounded-xl border border-slate-100 dark:border-neutral-700 shadow-sm">
<div class="bg-primary/10 p-2 rounded-full mb-2">
<span class="material-symbols-outlined text-primary text-[20px]">barcode_scanner</span>
</div>
<span class="text-2xl font-bold text-slate-900 dark:text-white">158</span>
<span class="text-[11px] font-semibold uppercase tracking-wide text-slate-400 dark:text-slate-500 text-center">Scanned Items</span>
</div>
<!-- Stat Card 3 -->
<div class="flex flex-col items-center justify-center p-4 bg-slate-50 dark:bg-neutral-800 rounded-xl border border-slate-100 dark:border-neutral-700 shadow-sm relative overflow-hidden">
<!-- Subtle highlight for impact -->
<div class="absolute top-0 right-0 w-8 h-8 bg-primary/20 rounded-bl-xl"></div>
<div class="bg-primary/10 p-2 rounded-full mb-2 z-10">
<span class="material-symbols-outlined text-primary text-[20px]">recycling</span>
</div>
<span class="text-2xl font-bold text-primary dark:text-primary z-10">3.2<span class="text-sm align-top ml-0.5">kg</span></span>
<span class="text-[11px] font-semibold uppercase tracking-wide text-slate-400 dark:text-slate-500 text-center z-10">Waste Saved</span>
</div>
</div>
</div>
<!-- Menu List -->
<div class="flex-1 px-4 pb-24 overflow-y-auto space-y-3">
<!-- Menu Item 1: Dietary Preferences -->
<div class="group flex flex-col bg-white dark:bg-neutral-800 border border-slate-100 dark:border-neutral-700 rounded-xl overflow-hidden transition-all hover:shadow-md">
<button class="flex items-center justify-between w-full p-4 text-left">
<div class="flex items-center gap-4">
<div class="flex items-center justify-center w-10 h-10 rounded-full bg-slate-50 dark:bg-neutral-700 text-slate-600 dark:text-slate-300 group-hover:bg-primary/10 group-hover:text-primary transition-colors">
<span class="material-symbols-outlined">restaurant_menu</span>
</div>
<div>
<h3 class="font-bold text-slate-900 dark:text-white text-base">Dietary Preferences</h3>
<p class="text-xs text-slate-500 dark:text-slate-400">Vegetarian, Nut-Free, Gluten-Free</p>
</div>
</div>
<span class="material-symbols-outlined text-slate-300 dark:text-slate-600">chevron_right</span>
</button>
<!-- Inline tags preview -->
<div class="px-4 pb-4 flex gap-2 overflow-x-auto no-scrollbar">
<span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-primary/10 text-primary-800 dark:text-primary">
                        Vegetarian
                    </span>
<span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-slate-100 dark:bg-neutral-700 text-slate-600 dark:text-slate-300">
                        Nut-Free
                    </span>
<span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-slate-100 dark:bg-neutral-700 text-slate-600 dark:text-slate-300">
                        Gluten-Free
                    </span>
</div>
</div>
<!-- Menu Item 2: Saved Recipes -->
<button class="flex items-center justify-between w-full p-4 bg-white dark:bg-neutral-800 border border-slate-100 dark:border-neutral-700 rounded-xl hover:shadow-md transition-all group">
<div class="flex items-center gap-4">
<div class="flex items-center justify-center w-10 h-10 rounded-full bg-slate-50 dark:bg-neutral-700 text-slate-600 dark:text-slate-300 group-hover:bg-primary/10 group-hover:text-primary transition-colors">
<span class="material-symbols-outlined">bookmark</span>
</div>
<div class="text-left">
<h3 class="font-bold text-slate-900 dark:text-white text-base">Saved Recipes</h3>
<p class="text-xs text-slate-500 dark:text-slate-400">12 Collections</p>
</div>
</div>
<span class="material-symbols-outlined text-slate-300 dark:text-slate-600">chevron_right</span>
</button>
<!-- Menu Item 3: Scan History -->
<button class="flex items-center justify-between w-full p-4 bg-white dark:bg-neutral-800 border border-slate-100 dark:border-neutral-700 rounded-xl hover:shadow-md transition-all group">
<div class="flex items-center gap-4">
<div class="flex items-center justify-center w-10 h-10 rounded-full bg-slate-50 dark:bg-neutral-700 text-slate-600 dark:text-slate-300 group-hover:bg-primary/10 group-hover:text-primary transition-colors">
<span class="material-symbols-outlined">history</span>
</div>
<div class="text-left">
<h3 class="font-bold text-slate-900 dark:text-white text-base">Scan History</h3>
<p class="text-xs text-slate-500 dark:text-slate-400">Last scan: Today, 10:30 AM</p>
</div>
</div>
<span class="material-symbols-outlined text-slate-300 dark:text-slate-600">chevron_right</span>
</button>
<!-- Menu Item 4: Account Settings -->
<button class="flex items-center justify-between w-full p-4 bg-white dark:bg-neutral-800 border border-slate-100 dark:border-neutral-700 rounded-xl hover:shadow-md transition-all group">
<div class="flex items-center gap-4">
<div class="flex items-center justify-center w-10 h-10 rounded-full bg-slate-50 dark:bg-neutral-700 text-slate-600 dark:text-slate-300 group-hover:bg-primary/10 group-hover:text-primary transition-colors">
<span class="material-symbols-outlined">settings</span>
</div>
<div class="text-left">
<h3 class="font-bold text-slate-900 dark:text-white text-base">Account Settings</h3>
<p class="text-xs text-slate-500 dark:text-slate-400">Manage subscription</p>
</div>
</div>
<span class="material-symbols-outlined text-slate-300 dark:text-slate-600">chevron_right</span>
</button>
<!-- Log Out -->
<button class="w-full pt-4 pb-8 text-center text-sm font-medium text-slate-400 hover:text-rose-500 transition-colors">
                Log Out
            </button>
</div>
<!-- Bottom Navigation Bar -->
<div class="absolute bottom-0 left-0 right-0 border-t border-slate-100 dark:border-neutral-800 bg-white dark:bg-neutral-900 px-6 pb-6 pt-3 z-50">
<div class="flex justify-between items-end">
<a class="flex flex-1 flex-col items-center gap-1 group" href="#">
<div class="text-slate-400 group-hover:text-primary transition-colors">
<span class="material-symbols-outlined text-[26px]">home</span>
</div>
<p class="text-slate-400 group-hover:text-primary text-[10px] font-medium tracking-wide">Home</p>
</a>
<a class="flex flex-1 flex-col items-center gap-1 group" href="#">
<div class="text-slate-400 group-hover:text-primary transition-colors">
<span class="material-symbols-outlined text-[26px]">center_focus_weak</span>
</div>
<p class="text-slate-400 group-hover:text-primary text-[10px] font-medium tracking-wide">Scan</p>
</a>
<a class="flex flex-1 flex-col items-center gap-1 group" href="#">
<div class="text-slate-400 group-hover:text-primary transition-colors">
<span class="material-symbols-outlined text-[26px]">menu_book</span>
</div>
<p class="text-slate-400 group-hover:text-primary text-[10px] font-medium tracking-wide">Recipes</p>
</a>
<a class="flex flex-1 flex-col items-center gap-1 text-primary" href="#">
<div class="text-primary">
<span class="material-symbols-outlined filled text-[26px]">person</span>
</div>
<p class="text-primary text-[10px] font-medium tracking-wide">Profile</p>
</a>
</div>
</div>
</div>
</body></html>




# 12. KitchenLens - Settings Page

<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>KitchenLens Settings</title>
<!-- Google Fonts & Icons -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Theme Config -->
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#19e65e",
                        "background-light": "#f6f8f6",
                        "background-dark": "#112116",
                    },
                    fontFamily: {
                        "display": ["Manrope", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "1rem", 
                        "lg": "2rem", 
                        "xl": "3rem", 
                        "full": "9999px"
                    },
                    backgroundImage: {
                        'glass-gradient': 'linear-gradient(135deg, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.1))',
                    }
                },
            },
        }
    </script>
<style>
        /* Custom Utilities for Glassmorphism */
        .glass-panel {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }
        .dark .glass-panel {
            background: rgba(17, 33, 22, 0.6); /* dark background tint */
            border: 1px solid rgba(255, 255, 255, 0.05);
        }
        
        /* Hide scrollbar for clean look */
        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }
        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        /* Toggle Switch Animation */
        .toggle-checkbox:checked {
            right: 0;
            border-color: #19e65e;
        }
        .toggle-checkbox:checked + .toggle-label {
            background-color: #19e65e;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-slate-100 antialiased selection:bg-primary/30">
<div class="relative flex h-full min-h-screen w-full flex-col overflow-hidden mx-auto max-w-md bg-background-light dark:bg-background-dark shadow-2xl">
<!-- Background Ambient Blobs -->
<div class="absolute top-0 left-0 w-full h-full overflow-hidden pointer-events-none z-0">
<div class="absolute -top-[10%] -left-[10%] w-[50%] h-[30%] bg-primary/20 rounded-full blur-3xl opacity-60"></div>
<div class="absolute top-[40%] -right-[20%] w-[60%] h-[40%] bg-primary/10 rounded-full blur-3xl opacity-50"></div>
</div>
<!-- Header -->
<div class="sticky top-0 z-20 flex items-center justify-between px-4 pt-12 pb-4 glass-panel border-b-0 rounded-b-xl">
<button class="flex h-10 w-10 items-center justify-center rounded-full hover:bg-black/5 dark:hover:bg-white/10 transition-colors text-slate-900 dark:text-white">
<span class="material-symbols-outlined text-[24px]">arrow_back</span>
</button>
<h1 class="text-lg font-bold tracking-tight text-slate-900 dark:text-white">Preferences</h1>
<button class="flex h-10 w-10 items-center justify-center rounded-full hover:bg-black/5 dark:hover:bg-white/10 transition-colors text-primary font-bold text-sm">
                Save
            </button>
</div>
<!-- Main Content (Scrollable) -->
<div class="flex-1 overflow-y-auto z-10 p-4 space-y-6 pb-24 no-scrollbar">
<!-- Dietary Requirements Section -->
<section>
<h2 class="px-2 mb-3 text-lg font-bold text-slate-900 dark:text-slate-100 flex items-center gap-2">
<span class="material-symbols-outlined text-primary">restaurant_menu</span>
                    Dietary Requirements
                </h2>
<div class="glass-panel rounded-xl overflow-hidden shadow-sm">
<!-- Item 1 -->
<div class="flex items-center justify-between p-4 border-b border-black/5 dark:border-white/5 last:border-0">
<div class="flex flex-col">
<span class="text-base font-medium text-slate-900 dark:text-white">Vegan</span>
<span class="text-xs text-slate-500 dark:text-slate-400">No animal products</span>
</div>
<label class="relative inline-flex items-center cursor-pointer">
<input checked="" class="sr-only peer" type="checkbox" value=""/>
<div class="w-11 h-6 bg-slate-200 peer-focus:outline-none peer-focus:ring-2 peer-focus:ring-primary/20 rounded-full peer dark:bg-slate-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
</label>
</div>
<!-- Item 2 -->
<div class="flex items-center justify-between p-4 border-b border-black/5 dark:border-white/5 last:border-0">
<div class="flex flex-col">
<span class="text-base font-medium text-slate-900 dark:text-white">Vegetarian</span>
<span class="text-xs text-slate-500 dark:text-slate-400">No meat, dairy allowed</span>
</div>
<label class="relative inline-flex items-center cursor-pointer">
<input class="sr-only peer" type="checkbox" value=""/>
<div class="w-11 h-6 bg-slate-200 peer-focus:outline-none peer-focus:ring-2 peer-focus:ring-primary/20 rounded-full peer dark:bg-slate-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
</label>
</div>
<!-- Item 3 -->
<div class="flex items-center justify-between p-4 border-b border-black/5 dark:border-white/5 last:border-0">
<div class="flex flex-col">
<span class="text-base font-medium text-slate-900 dark:text-white">Keto</span>
<span class="text-xs text-slate-500 dark:text-slate-400">High fat, low carb</span>
</div>
<label class="relative inline-flex items-center cursor-pointer">
<input class="sr-only peer" type="checkbox" value=""/>
<div class="w-11 h-6 bg-slate-200 peer-focus:outline-none peer-focus:ring-2 peer-focus:ring-primary/20 rounded-full peer dark:bg-slate-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
</label>
</div>
<!-- Item 4 -->
<div class="flex items-center justify-between p-4 border-b border-black/5 dark:border-white/5 last:border-0">
<div class="flex flex-col">
<span class="text-base font-medium text-slate-900 dark:text-white">Paleo</span>
<span class="text-xs text-slate-500 dark:text-slate-400">Whole foods only</span>
</div>
<label class="relative inline-flex items-center cursor-pointer">
<input class="sr-only peer" type="checkbox" value=""/>
<div class="w-11 h-6 bg-slate-200 peer-focus:outline-none peer-focus:ring-2 peer-focus:ring-primary/20 rounded-full peer dark:bg-slate-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
</label>
</div>
</div>
</section>
<!-- Allergies & Avoidances -->
<section>
<h2 class="px-2 mb-3 text-lg font-bold text-slate-900 dark:text-slate-100 flex items-center gap-2">
<span class="material-symbols-outlined text-primary">warning</span>
                    Allergies &amp; Avoidances
                </h2>
<div class="glass-panel rounded-xl p-5 shadow-sm">
<p class="text-sm text-slate-500 dark:text-slate-400 mb-4">Select ingredients to exclude from all recommendations.</p>
<div class="flex flex-wrap gap-2">
<!-- Selected Chip -->
<button class="px-4 py-2 rounded-full bg-primary text-slate-900 text-sm font-semibold shadow-md shadow-primary/20 transition-transform active:scale-95 flex items-center gap-1">
<span class="material-symbols-outlined text-[18px]">check</span>
                            Peanuts
                        </button>
<!-- Unselected Chips -->
<button class="px-4 py-2 rounded-full bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 text-sm font-medium hover:border-primary/50 transition-colors active:scale-95">
                            Tree Nuts
                        </button>
<button class="px-4 py-2 rounded-full bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 text-sm font-medium hover:border-primary/50 transition-colors active:scale-95">
                            Dairy
                        </button>
<button class="px-4 py-2 rounded-full bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 text-sm font-medium hover:border-primary/50 transition-colors active:scale-95">
                            Eggs
                        </button>
<button class="px-4 py-2 rounded-full bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 text-sm font-medium hover:border-primary/50 transition-colors active:scale-95">
                            Shellfish
                        </button>
<button class="px-4 py-2 rounded-full bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 text-sm font-medium hover:border-primary/50 transition-colors active:scale-95">
                            Soy
                        </button>
<button class="px-4 py-2 rounded-full bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 text-sm font-medium hover:border-primary/50 transition-colors active:scale-95">
                            Wheat
                        </button>
<button class="px-4 py-2 rounded-full bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 text-sm font-medium hover:border-primary/50 transition-colors active:scale-95 flex items-center gap-1">
<span class="material-symbols-outlined text-[18px]">add</span>
                           Add Custom
                        </button>
</div>
</div>
</section>
<!-- App Settings Section -->
<section>
<h2 class="px-2 mb-3 text-lg font-bold text-slate-900 dark:text-slate-100 flex items-center gap-2">
<span class="material-symbols-outlined text-primary">settings</span>
                    App Configuration
                </h2>
<div class="glass-panel rounded-xl overflow-hidden shadow-sm">
<!-- Notifications -->
<div class="flex items-center justify-between p-4 border-b border-black/5 dark:border-white/5 last:border-0">
<div class="flex items-center gap-3">
<div class="flex h-8 w-8 items-center justify-center rounded-full bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300">
<span class="material-symbols-outlined text-[20px]">notifications</span>
</div>
<span class="text-base font-medium text-slate-900 dark:text-white">Push Notifications</span>
</div>
<label class="relative inline-flex items-center cursor-pointer">
<input checked="" class="sr-only peer" type="checkbox" value=""/>
<div class="w-11 h-6 bg-slate-200 peer-focus:outline-none peer-focus:ring-2 peer-focus:ring-primary/20 rounded-full peer dark:bg-slate-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
</label>
</div>
<!-- Measurement Units -->
<div class="flex items-center justify-between p-4 border-b border-black/5 dark:border-white/5 last:border-0">
<div class="flex items-center gap-3">
<div class="flex h-8 w-8 items-center justify-center rounded-full bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300">
<span class="material-symbols-outlined text-[20px]">scale</span>
</div>
<span class="text-base font-medium text-slate-900 dark:text-white">Units</span>
</div>
<!-- Segmented Control -->
<div class="flex p-1 bg-slate-100 dark:bg-slate-800 rounded-lg">
<button class="px-3 py-1 text-xs font-semibold rounded bg-white dark:bg-slate-700 text-slate-900 dark:text-white shadow-sm transition-all">Metric</button>
<button class="px-3 py-1 text-xs font-medium rounded text-slate-500 dark:text-slate-400 hover:text-slate-900 dark:hover:text-white transition-all">Imperial</button>
</div>
</div>
<!-- Dark Mode -->
<div class="flex items-center justify-between p-4 border-b border-black/5 dark:border-white/5 last:border-0">
<div class="flex items-center gap-3">
<div class="flex h-8 w-8 items-center justify-center rounded-full bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300">
<span class="material-symbols-outlined text-[20px]">dark_mode</span>
</div>
<span class="text-base font-medium text-slate-900 dark:text-white">Dark Mode</span>
</div>
<label class="relative inline-flex items-center cursor-pointer">
<input class="sr-only peer" type="checkbox" value=""/>
<div class="w-11 h-6 bg-slate-200 peer-focus:outline-none peer-focus:ring-2 peer-focus:ring-primary/20 rounded-full peer dark:bg-slate-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
</label>
</div>
</div>
</section>
<!-- Save Button Area -->
<div class="pt-4">
<button class="w-full bg-primary hover:bg-green-500 text-slate-900 font-bold py-4 rounded-full shadow-lg shadow-primary/30 transition-all active:scale-[0.98] text-lg">
                    Save Preferences
                </button>
</div>
</div>
<!-- Bottom Navigation Bar -->
<div class="absolute bottom-0 left-0 w-full z-20">
<div class="flex gap-2 border-t border-[#f0f4f2] dark:border-white/10 bg-white dark:bg-[#112116] px-4 pb-6 pt-2 shadow-[0_-5px_15px_rgba(0,0,0,0.02)]">
<a class="just flex flex-1 flex-col items-center justify-end gap-1 text-slate-500 dark:text-slate-400 hover:text-primary dark:hover:text-primary transition-colors group" href="#">
<div class="flex h-8 items-center justify-center group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-[24px]">home</span>
</div>
<p class="text-xs font-medium leading-normal tracking-[0.015em]">Home</p>
</a>
<a class="just flex flex-1 flex-col items-center justify-end gap-1 text-slate-500 dark:text-slate-400 hover:text-primary dark:hover:text-primary transition-colors group" href="#">
<div class="flex h-8 items-center justify-center group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-[24px]">photo_camera</span>
</div>
<p class="text-xs font-medium leading-normal tracking-[0.015em]">Scan</p>
</a>
<a class="just flex flex-1 flex-col items-center justify-end gap-1 text-slate-500 dark:text-slate-400 hover:text-primary dark:hover:text-primary transition-colors group" href="#">
<div class="flex h-8 items-center justify-center group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-[24px]">menu_book</span>
</div>
<p class="text-xs font-medium leading-normal tracking-[0.015em]">Recipes</p>
</a>
<!-- Active State -->
<a class="just flex flex-1 flex-col items-center justify-end gap-1 rounded-full text-primary" href="#">
<div class="flex h-8 items-center justify-center">
<span class="material-symbols-outlined text-[24px] fill-current">settings</span>
</div>
<p class="text-xs font-medium leading-normal tracking-[0.015em]">Settings</p>
</a>
</div>
</div>
</div>
</body></html>