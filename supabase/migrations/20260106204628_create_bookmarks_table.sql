-- Create bookmarks table
CREATE TABLE public.bookmarks (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    companion_id UUID NOT NULL REFERENCES public.companions(id) ON DELETE CASCADE,
    user_id TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Create index for faster queries
CREATE INDEX idx_bookmarks_user_id ON public.bookmarks(user_id);
CREATE INDEX idx_bookmarks_companion_id ON public.bookmarks(companion_id);

-- Add unique constraint to prevent duplicate bookmarks
ALTER TABLE public.bookmarks ADD CONSTRAINT unique_user_companion_bookmark UNIQUE (user_id, companion_id);