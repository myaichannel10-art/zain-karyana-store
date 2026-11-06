# Zain Karyana Store — VS Code setup

## 1. Open project
1. Download and unzip this folder.
2. Install Node.js LTS from https://nodejs.org/
3. Open VS Code > File > Open Folder > select `zain-karyana-store-full`.
4. Open Terminal > New Terminal and run:

```bash
npm install
npm run dev
```

Open the localhost link shown in the terminal (usually http://localhost:5173).

## 2. Free Supabase backend
1. Create a free project at https://supabase.com
2. Open SQL Editor > New query. Paste all of `supabase-setup.sql`, then Run.
3. Project Settings > API: copy Project URL and anon/publishable key.
4. Copy `.env.example` to a new file named `.env` in the main project folder.
5. Fill:
```
VITE_SUPABASE_URL=https://YOUR_PROJECT.supabase.co
VITE_SUPABASE_ANON_KEY=YOUR_ANON_OR_PUBLISHABLE_KEY
VITE_WHATSAPP_NUMBER=
```
WhatsApp number should be country code + digits only, e.g. 923001234567. Leave blank until ready. Restart `npm run dev` after editing .env.

## 3. Owner account
Supabase Dashboard > Authentication > Users > Add user. Create owner's email and password. Disable public sign-ups. On website click Owner and log in. Keep this account private.

Owner panel shows order count, customer orders, order status, and product add/edit/delete. Customers do not see the panel unless they have a Supabase authenticated account; do not create accounts for customers.

## 4. Invoice
After successful checkout, customer clicks Download / Print invoice. In the print window choose Save as PDF. This creates an order invoice, not proof of payment.

## 5. Free hosting
Push project to GitHub, import it at https://vercel.com, add the same environment variables in Vercel, and deploy.

Important: demo products/prices need to be replaced by real shop stock/prices. Keep public sign-ups disabled. Never put a Supabase service-role key in frontend code. The map section uses the shop address and your supplied Google Maps link.
