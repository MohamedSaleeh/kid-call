create extension if not exists pgcrypto;

create table public.kids (
  id uuid not null default gen_random_uuid(),
  created_at timestamp with time zone not null default now(),
  user_id uuid not null,
  full_name text not null,
  classroom text not null,
  is_confirmed boolean not null default false,

  constraint kids_pkey primary key (id),

  constraint kids_user_id_fkey
    foreign key (user_id)
    references auth.users (id)
    on update cascade
    on delete cascade
) tablespace pg_default;