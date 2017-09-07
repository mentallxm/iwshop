{foreach from=$products item=pd}
    <div class="pdBlock" data-id="{$pd.product_id}">
        <a class="sel"></a>
        <p class="title Elipsis">{$pd.product_name}</p>
        <img height="100" width="100" src="{$pd.catimg}@1e_1c_0o_0l_100h_100w_90q.src" />
        <p class="prices Elipsis">{$pd.sale_prices}</p>
    </div>
{/foreach}