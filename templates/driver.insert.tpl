{include file="head.tpl"}

<div class="container">
    <div class="panel panel-warning">
        <div class="panel-heading">
            <h3 class="panel-title">{$lang["Register new Driver"]}</h3>
        </div>
        <div class="panel-body">

            {if $php.saved}
                {$lang["Driver added."]}
            {else}
                {if $php.error}
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">{$php.error}</h3>
                        </div>
                    </div>
                {/if}
                <form method="post">
                    {$lang["Last name:"]}
                    <input type="text" class="form-control" name="last_name" value="{$php.driver.last_name}" />
                    <br>
                    {$lang["First name:"]}
                    <input type="text" class="form-control" name="first_name" value="{$php.driver.first_name}" />
                    <br>
                    {$lang["Father name:"]}
                    <input type="text" class="form-control" name="father_name" value="{$php.driver.father_name}" />
                    <br>
                    {$lang["Passport serial:"]}
                    <input type="text" class="form-control" name="passport_serial" value="{$php.driver.passport_serial}" />
                    <br>
                    {$lang["Passport number:"]}
                    <input type="text" class="form-control" name="passport_number" value="{$php.driver.passport_number}" />
                    <br>
                    {$lang["Info:"]}
                    <input type="text" class="form-control" name="info" value="{$php.driver.info}" />
                    <br>
                    <input type="submit" value="{$lang["Add driver"]}" class="btn btn-warning" />
                </form>

            {/if}
        </div>
    </div>
</div>

{include file="tail.tpl"}



