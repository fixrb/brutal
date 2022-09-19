# frozen_string_literal: true

# Three-input ⊕ outputs.

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  true ^ true ^ true
end

raise if actual.itself != true

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  true ^ true ^ false
end

raise if actual.itself != false

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  true ^ false ^ true
end

raise if actual.itself != false

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  true ^ false ^ false
end

raise if actual.itself != true

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  false ^ true ^ true
end

raise if actual.itself != false

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  false ^ true ^ false
end

raise if actual.itself != true

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  false ^ false ^ true
end

raise if actual.itself != true

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  false ^ false ^ false
end

raise if actual.itself != false

# Finishing a test

# ------------------------------------------------------------------------------

# End of the brutal test
