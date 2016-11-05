{include file="head.tpl"}

<div class="container">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">{$lang["Information about Driver"]}</h3>
        </div>
        <div class="panel-body">

            {if $php.message}
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title">{$php.message}</h3>
                    </div>
                </div>
            {/if}

            <a href="/driver/list" class="btn btn-info">{$lang["Return"]}</a>

        </div>
    </div>
</div>

{include file="tail.tpl"}