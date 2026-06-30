create extension if not exists pgcrypto;

create table public.calls (
  id uuid not null default gen_random_uuid(),
  created_at timestamp with time zone not null default now(),

  user_id uuid not null,
  kid_id uuid not null,

  call_time timestamp with time zone null,

  constraint calls_pkey primary key (id),

  constraint calls_user_id_fkey
    foreign key (user_id)
    references auth.users (id)
    on update cascade
    on delete cascade,

  constraint calls_kid_id_fkey
    foreign key (kid_id)
    references public.kids (id)
    on update cascade
    on delete cascade
) tablespace pg_default;