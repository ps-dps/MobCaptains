from beet import Context

def beet_default(ctx: Context):

    comment = f'# {ctx.project_name} {ctx.project_version} by {ctx.project_author}'
    namespace = ctx.meta.get("credit")
    
    for name, function in ctx.data.functions.items():
        if namespace and name.split(':')[0] not in namespace:
            continue
        function.prepend(comment)
        function.append(comment)
