# frozen_string_literal: true

# Three-input ⊕ outputs.

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  true ^ true ^ true
end

# Finishing an example

raise if actual.itself != true

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  true ^ true ^ false
end

# Finishing an example

raise if actual.itself != false

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  true ^ false ^ true
end

# Finishing an example

raise if actual.itself != false

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  true ^ false ^ false
end

# Finishing an example

raise if actual.itself != true

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  false ^ true ^ true
end

# Finishing an example

raise if actual.itself != false

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  false ^ true ^ false
end

# Finishing an example

raise if actual.itself != true

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  false ^ false ^ true
end

# Finishing an example

raise if actual.itself != true

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  false ^ false ^ false
end

# Finishing an example

raise if actual.itself != false

# ------------------------------------------------------------------------------

# End of the brutal test
