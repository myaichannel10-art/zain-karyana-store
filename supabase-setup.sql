-- Run all of this in Supabase > SQL Editor > New query.
create extension if not exists pgcrypto;
create table if not exists public.products(
 id uuid primary key default gen_random_uuid(),
 name text not null, category text not null default 'Essentials',
 price numeric(10,2) not null check(price>=0),
 unit text not null default '1 piece', emoji text default '🛒',
 description text default '', created_at timestamptz not null default now()
);
create table if not exists public.orders(
 id uuid primary key default gen_random_uuid(),
 customer_name text not null, phone text not null, address text not null,
 notes text default '', items jsonb not null, total numeric(10,2) not null check(total>=0),
 status text not null default 'Received', created_at timestamptz not null default now()
);
alter table public.products enable row level security;
alter table public.orders enable row level security;
drop policy if exists "Public read products" on public.products;
create policy "Public read products" on public.products for select to anon,authenticated using(true);
drop policy if exists "Owner add products" on public.products;
create policy "Owner add products" on public.products for insert to authenticated with check(true);
drop policy if exists "Owner edit products" on public.products;
create policy "Owner edit products" on public.products for update to authenticated using(true) with check(true);
drop policy if exists "Owner delete products" on public.products;
create policy "Owner delete products" on public.products for delete to authenticated using(true);
drop policy if exists "Customers place orders" on public.orders;
create policy "Customers place orders" on public.orders for insert to anon,authenticated with check(length(trim(customer_name))>0 and length(trim(phone))>0 and length(trim(address))>0 and jsonb_typeof(items)='array' and total>=0);
drop policy if exists "Owner read orders" on public.orders;
create policy "Owner read orders" on public.orders for select to authenticated using(true);
drop policy if exists "Owner update orders" on public.orders;
create policy "Owner update orders" on public.orders for update to authenticated using(true) with check(true);
