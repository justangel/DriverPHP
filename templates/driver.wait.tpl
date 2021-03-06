{include file="head.tpl"}

<div class="container">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">{$lang["List of drivers on the verification"]}</h3>
        </div>
    </div>

    {if $php.wait|@count == 0}
        {$lang["The list is empty"]}
    {else}
        <table class="table table-bordered table-hover">
            <thead>
            <tr class="bg-primary">
                <th class="text-center">{$lang["#"]}</th>
                <th class="text-center">{$lang["Name"]}</th>
                <th class="text-center">{$lang["Info"]}</th>
                <th class="text-center">{$lang["Documents"]}</th>
                {if $user.status == 1}
                    <th class="text-center">{$lang["Status"]}</th>
                {else}
                    <th class="text-center">{$lang["Owner"]}</th>
                {/if}
            </tr>
            </thead>
            <tbody>
            {foreach from=$php.wait item=row}
                <tr class="{if $row.status == 1}bg-warning{else}bg-success{/if}">
                    <td class="text-center"><a href="/driver/info/driver_id={$row.id}" class="btn btn-info">{$row.id}</a></td>
                    <td class="text-left">{$row.last_name} {$row.first_name} {$row.father_name}</td>
                    <td class="text-left">{$row.info}</td>
                    <td class="text-center"><a href="/docs/list/driver_id={$row.id}" class="btn btn-default"
                        >{if $row.docs}{$row.docs}{else}-{/if}</a></td>
                    {if $user.status == 1}
                        <td class="text-center">{$lang["status`$row.status`"]}</td>
                    {else}
                        <td class="text-center">{$row.user_name}</td>
                    {/if}
                </tr>
            {/foreach}
            </tbody>
        </table>
    {/if}
</div>

{include file="tail.tpl"}