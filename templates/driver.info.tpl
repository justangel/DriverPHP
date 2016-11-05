{include file="head.tpl"}

<div class="container">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">{$lang["Information about Driver"]}</h3>
        </div>
        <div class="panel-body">

{if $php.error}
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">{$php.error}</h3>
                </div>
            </div>
            <a href="/driver/list" class="btn btn-info">{$lang["Return"]}</a>
{else}

            <dl class="dl-horizontal">
                <dt>{$lang["ID:"]}</dt>
                <dd>{$php.info.id}</dd>
                <dt>{$lang["Status:"]}</dt>
                <dd>{$php.info.status_text}</dd>
            </dl>

            <dl class="dl-horizontal">
                <dt>{$lang["Last name:"]}</dt>
                <dd>{$php.info.last_name}</dd>
                <dt>{$lang["First name:"]}</dt>
                <dd>{$php.info.first_name}</dd>
                <dt>{$lang["Father name:"]}</dt>
                <dd>{$php.info.father_name}</dd>
            </dl>

            <br>

            <dl class="dl-horizontal">
                <dt>{$lang["Passport serial:"]}</dt>
                <dd>{$php.info.passport_serial}</dd>
                <dt>{$lang["Passport number:"]}</dt>
                <dd>{$php.info.passport_number}</dd>
            </dl>

            <br>

            <dl class="dl-horizontal">
                <dt>{$lang["Info:"]}</dt>
                <dd>{$php.info.info}</dd>
            </dl>
        {if $user.status >= 2}
            {if $php.info.status == 1}
                <a href="/driver/confirm/driver_id={$php.info.id}/status=2" class="btn btn-success"
                    >{$lang["Confirm"]}</a>
            {else}
                <a href="/driver/confirm/driver_id={$php.info.id}/status=1" class="btn btn-warning"
                >{$lang["UnConfirm"]}</a>
            {/if}
        {/if}
            <a href="/driver/confirm/driver_id={$php.info.id}/status=drop" class="btn btn-danger"
               onclick="return confirm('{$lang["Do you really want to delete this record?"]}');"
                >{$lang["Delete"]}</a>
{/if}
        </div>
    </div>
</div>

{include file="tail.tpl"}