-- Pandoc Lua filter: rewrite relative image paths to absolute ones, resolved
-- against pandoc's working directory. Used by the live preview, whose generated
-- .typ lives in a temp dir (Typst resolves leading-slash paths against --root).
function Image(img)
  if not img.src:match('^/') and not img.src:match('^%a[%w+.-]*:') then
    img.src = pandoc.path.normalize(
      pandoc.path.join({ pandoc.system.get_working_directory(), img.src })
    )
  end
  return img
end
