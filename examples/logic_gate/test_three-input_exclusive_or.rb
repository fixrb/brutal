# frozen_string_literal: true

# Three-input ⊕ outputs.

# ------------------------------------------------------------------------------

actual = begin
  true ^ true ^ true
end

raise if actual.itself != true

# ------------------------------------------------------------------------------

actual = begin
  true ^ true ^ false
end

raise if actual.itself != false

# ------------------------------------------------------------------------------

actual = begin
  true ^ false ^ true
end

raise if actual.itself != false

# ------------------------------------------------------------------------------

actual = begin
  true ^ false ^ false
end

raise if actual.itself != true

# ------------------------------------------------------------------------------

actual = begin
  false ^ true ^ true
end

raise if actual.itself != false

# ------------------------------------------------------------------------------

actual = begin
  false ^ true ^ false
end

raise if actual.itself != true

# ------------------------------------------------------------------------------

actual = begin
  false ^ false ^ true
end

raise if actual.itself != true

# ------------------------------------------------------------------------------

actual = begin
  false ^ false ^ false
end

raise if actual.itself != false
