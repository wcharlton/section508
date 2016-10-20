class Section508Exception < Exception
end

class Section508AttributeException < Section508Exception
end

class Section508ContentException < Section508Exception
end

class Section508TagDeprecationException < Section508Exception
end

class Section508SupportException < Section508Exception
end
