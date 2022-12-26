from common.logging import logit


@logit
def custom_tag_string(tag_string: str) -> list:
    """Parses tag string to list of tags."""
    if not tag_string:
        return []
    if "," not in tag_string and " " not in tag_string:
        return [tag_string]
    tags = []
    for i, tag in enumerate(tag_string.split(",")):
        tags.append(tag.strip().lower().replace(" ", "-"))
    return tags
